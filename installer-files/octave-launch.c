/*
 * Wrapper application to set octave env variables and then run octave
 * compile with gcc -o octave-launch octave-launch.c -Wl,--subsystem,windows -lshlwapi
 *
 * Copyright (C) 2020 John Donoghue <john.donoghue@ieee.org>
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation; either version 3 of the License, or (at your option) any later
 * version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program; if not, see <http: *www.gnu.org/licenses/>.
*/

#include <windows.h>
#include <shlwapi.h>

static int ParentDir (char *dir)
{
  int len = strlen (dir);
  while (len > 0 && dir[len] != '\\')
    len --;
  dir[len] = 0;
  return len;
}

char * FilePart (char *dir)
{
  int len = strlen (dir);
  while (len > 0 && dir[len-1] != '\\')
    len --;
  return &dir[len];
}

// Set up environment and launch octave.exe with appropriate
// arguments.  NOTE: There are corresponding VBS and BAT script
// versions of this program so any changes here may need to be made in
// those scripts as well.

int main (int argc, char **argv)
{
  PROCESS_INFORMATION pi;

  // FIXME: There are currently have no checks to ensure that the
  // following fixed-size buffers are sufficiently large.  Maybe it
  // would be better if we used C++ and std::string objects?  For
  // buffers that are passed to Windows library functions to hold
  // output values, is 1024 the correct way to define the size of the
  // buffer?  Note that the use of sizeof(path)-1 below will fail if
  // we switch to using
  //
  //   char *path = (char *) malloc (...);
  //
  // instead of literal character arrays.

  char msyspath[1024];
  char rootpath[1024];
  char path[1024];
  char binpath[1024];

  int gui_arg_found = 0;
  int no_gui_arg_found = 0;
  int no_gui_libs = 0;
  int i;

  /* get path of us which we will assume is the root of the install */

  DWORD nSize = GetModuleFileName (NULL, path, sizeof(path)-1);
  if (nSize)
    {
      while (nSize > 0 && path[nSize] != '\\')
        nSize --;
      path[nSize] = '\0';
    }

  nSize = GetShortPathName (path, rootpath, sizeof(rootpath)-1);
  if (nSize == 0)
    StrCpy (rootpath, path);

  SetEnvironmentVariable ("MXE_ROOT", rootpath);

  /* get msys path and set env */

  StrCpy (msyspath, rootpath);

  StrCpy (path, rootpath);
  StrCat (path, "\\mingw64\\bin\\octave.exe");
  if (PathFileExists (path))
    {
      SetEnvironmentVariable ("MSYSTEM", "MINGW64");
      StrCat (msyspath, "\\usr");
      SetEnvironmentVariable ("MSYSPATH", msyspath);

      StrCat (msyspath, "\\bin");

      StrCpy (binpath, rootpath);
      StrCat (binpath, "\\mingw64\\bin");
    }
  else
    {
      StrCpy (path, rootpath);
      StrCat (path, "\\mingw32\\bin\\octave.exe");
      if (PathFileExists (path))
        {
          SetEnvironmentVariable ("MSYSTEM", "MINGW32");
          StrCat (msyspath, "\\usr");
          SetEnvironmentVariable ("MSYSPATH", msyspath);

          StrCat (msyspath, "\\bin");

          StrCpy (binpath, rootpath);
          StrCat (binpath, "\\mingw32\\bin");
        }
      else
        {
          SetEnvironmentVariable ("MSYSTEM", "MSYS");
          SetEnvironmentVariable ("MSYSPATH", msyspath);

          StrCat (msyspath, "\\bin");

          StrCpy (binpath, rootpath);
          StrCat (binpath, "\\bin");
        }
    }

  /* binpath is to the octave bin dir so get the parent */
  StrCpy (path, binpath);
  ParentDir (path);

 #ifdef SHOW_PATHS
  MessageBox (NULL, rootpath, "octroot", MB_OK);
  MessageBox (NULL, path, "octhome", MB_OK);
  MessageBox (NULL, binpath, "octbin", MB_OK);
  MessageBox (NULL, msyspath, "msysbin", MB_OK);
 #endif

  /* qt paths
   * either %OCT_HOME%\qt5\plugins
   * or %OCT_HOME\plugins
   */
  nSize = strlen (path);
  StrCat (path, "\\qt5\\plugins");
  SetEnvironmentVariable ("QT_PLUGIN_PATH", path);

  path[nSize] = '\0';

  /* exe paths */
  {
    char pathbuffer[8096];
    char newpathbuffer[8096];

    nSize = GetEnvironmentVariable ("PATH", pathbuffer, sizeof(pathbuffer)-1);
    pathbuffer[nSize] = '\0';

    /* set our paths first */
    StrCpy (newpathbuffer, binpath);
    StrCat (newpathbuffer, ";");
    StrCat (newpathbuffer, msyspath);
    StrCat (newpathbuffer, ";");
    StrCat (newpathbuffer, pathbuffer);

    SetEnvironmentVariable ("PATH", newpathbuffer);
  }

  /* other env */
  SetEnvironmentVariable ("TERM", "cygwin");
  SetEnvironmentVariable ("GNUTERM", "wxt");
  SetEnvironmentVariable ("GS", "gs.exe");

  /* home set */
  nSize = GetEnvironmentVariable ("HOME", path, sizeof(path)-1);
  if (nSize == 0 || path[0] == 0)
    {
      char newhome[1024];

      nSize = GetEnvironmentVariable ("USERPROFILE", path, sizeof(path)-1);
      if (nSize == 0 || path[0] == 0)
        {
          /* build dir from drive and path */
          char tmpbuff[1024];
          nSize = GetEnvironmentVariable ("HOMEDRIVE", tmpbuff, sizeof(tmpbuff)-1);
          if (nSize)
            StrCpy (path, tmpbuff);
          else
            path[0] = '\0';

          nSize = GetEnvironmentVariable ("HOMEPATH", tmpbuff, sizeof(tmpbuff)-1);
          if (nSize) StrCat (path, tmpbuff);
        }

      nSize = GetShortPathName (path, newhome, sizeof(newhome)-1);

      if (nSize == 0)
        {
          StrCpy (newhome, path);
        }

      SetEnvironmentVariable ("HOME", newhome);
    }

  /* check for gui mode */
  for (i = 1; i < argc; i++)
    {
      if (StrCmp (argv[i], "--no-gui-libs") == 0)
        {
          if (gui_arg_found)
            {
              /* Inconsistent options.  We can't start the GUI without gui libs.
                 How should we fail?   For now, --no-gui-libs will
                 override the other options.  */
            }

          no_gui_libs = 1;
        }
      else if (StrCmp (argv[i], "--gui") == 0
               || StrCmp (argv[i], "--force-gui") == 0)
        {
          if (no_gui_libs)
            {
              /* Inconsistent options.  We can't start the GUI without gui libs.
                 How should we fail?   For now, --no-gui-libs will
                 override the other options.  */
            }

          gui_arg_found = 1;
        }
      else if (StrCmp (argv[i], "--no-gui") == 0)
        no_gui_arg_found = 1;

      /* NOTE: specifying both --no-gui and --gui is also an
         inconsistent set of options but we leave it to octave.exe to
         detect that.  */
    }

  /* set up process args and start it */
  {
    STARTUPINFO si;
    char argbuffer[4096];

    ZeroMemory (&si, sizeof(si));
    si.cb = sizeof(si);
    ZeroMemory (&pi, sizeof(pi));

    StrCpy (path, binpath);

    StrCpy (argbuffer, "octave.exe ");
    StrCat (path, "\\octave.exe");

    if (! (no_gui_libs || no_gui_arg_found))
      {
        /* Unless --no-gui or --no-gui-libs is specified, we will use a GUI window.  */
        si.dwFlags = STARTF_USESHOWWINDOW;

        /* If none of the options --no-gui, --gui, or --force-gui
           were specified, then we'll add --gui to start the gui as
           most Windows users would expect.  */

        if (! gui_arg_found)
          StrCat (argbuffer, "--gui ");
      }

    /* quote and append each arg */
    for (i = 1; i < argc; i++)
      {
        StrCat (argbuffer, "\"");
        StrCat (argbuffer, argv[i]);
        StrCat (argbuffer, "\" ");
      }

    /* Start the child process */
    int status = CreateProcess (path,       // Module name
                                argbuffer,  // Command line
                                NULL,       // Process handle not inheritable
                                NULL,       // Thread handle not inheritable
                                FALSE,      // Set handle inheritance to FALSE
                                0,          // No creation flags
                                NULL,       // Use parent's environment block
                                NULL,       // Use parent's starting directory
                                &si,        // Pointer to STARTUPINFO
                                &pi);       // Pointer to PROCESS_INFORMATION

    if (! status)
      return 1;
  }

  /* Wait until child process exits. */
  WaitForSingleObject (pi.hProcess, INFINITE);

  /* Close process and thread handles */
  CloseHandle (pi.hProcess);
  CloseHandle (pi.hThread);

  return 0;
}

/*
 * Wrapper application to set octave env variables and then run octave
 *
 * Copyright (C) 2020-2021 John Donoghue <john.donoghue@ieee.org>
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
#include <strsafe.h>

static int ParentDir (wchar_t *dir)
{
  int len = lstrlenW (dir);
  while (len > 0 && dir[len] != L'\\')
    len --;
  dir[len] = 0;
  return len;
}

wchar_t * FilePart (wchar_t *dir)
{
  int len = lstrlenW (dir);
  while (len > 0 && dir[len-1] != L'\\')
    len --;
  return &dir[len];
}

// Set up environment and launch octave.exe with appropriate
// arguments.  NOTE: There are corresponding VBS and BAT script
// versions of this program so any changes here may need to be made in
// those scripts as well.

int wmain (int argc, wchar_t **argv)
{
  PROCESS_INFORMATION pi;

  // FIXME: There are currently have no checks to ensure that the
  // following fixed-size buffers are sufficiently large.  MAX_PATH is
  // 260 on Winndows by default.  But a user might have increased that
  // limit to 32767 characters by manually changing policy settings.
  // Maybe it would be better if we used C++ and std::string objects?
  // Note that the use of sizeof(path)-1 will fail if we switch to
  // using
  //
  //   wchar_t *path = (wchar_t *) malloc (...);
  //
  // instead of literal character arrays.

#define PATH_SZ 1024
  wchar_t msyspath[PATH_SZ];
  wchar_t rootpath[PATH_SZ];
  wchar_t path[PATH_SZ];
  wchar_t binpath[PATH_SZ];

  int gui_arg_found = 0;
  int no_gui_arg_found = 0;
  int no_gui_libs = 0;
  int i;

  /* get path of us which we will assume is the root of the install */

  DWORD nSize = GetModuleFileNameW (NULL, path, PATH_SZ-1);
  if (nSize)
    {
      while (nSize > 0 && path[nSize] != L'\\')
        nSize --;
      path[nSize] = L'\0';
    }

#ifdef NO_SHORT_PATH_NAMES
  StringCchCopyW (rootpath, PATH_SZ, path);
#else
  /* transform to short paths to work around issues with spaces in
     paths */
  /* FIXME: This won't help on systems with de-activated short paths */
  nSize = GetShortPathNameW (path, rootpath, PATH_SZ-1);
  if (nSize == 0)
    StringCchCopyW (rootpath, PATH_SZ, path);
#endif

  SetEnvironmentVariableW (L"MXE_ROOT", rootpath);

  /* get msys path and set env */

  StringCchCopyW (msyspath, PATH_SZ, rootpath);

  StringCchCopyW (path, PATH_SZ, rootpath);
  StringCchCatW (path, PATH_SZ, L"\\mingw64\\bin\\octave.exe");
  if (PathFileExistsW (path))
    {
      SetEnvironmentVariableW (L"MSYSTEM", L"MINGW64");
      StringCchCatW (msyspath, PATH_SZ, L"\\usr");
      SetEnvironmentVariableW (L"MSYSPATH", msyspath);

      StringCchCatW (msyspath, PATH_SZ, L"\\bin");

      StringCchCopyW (binpath, PATH_SZ, rootpath);
      StringCchCatW (binpath, PATH_SZ, L"\\mingw64\\bin");
    }
  else
    {
      StringCchCopyW (path, PATH_SZ, rootpath);
      StringCchCatW (path, PATH_SZ, L"\\mingw32\\bin\\octave.exe");
      if (PathFileExistsW (path))
        {
          SetEnvironmentVariableW (L"MSYSTEM", L"MINGW32");
          StringCchCatW (msyspath, PATH_SZ, L"\\usr");
          SetEnvironmentVariableW (L"MSYSPATH", msyspath);

          StringCchCatW (msyspath, PATH_SZ, L"\\bin");

          StringCchCopyW (binpath, PATH_SZ, rootpath);
          StringCchCatW (binpath, PATH_SZ, L"\\mingw32\\bin");
        }
      else
        {
          SetEnvironmentVariableW (L"MSYSTEM", L"MSYS");
          SetEnvironmentVariableW (L"MSYSPATH", msyspath);

          StringCchCatW (msyspath, PATH_SZ, L"\\bin");

          StringCchCopyW (binpath, PATH_SZ, rootpath);
          StringCchCatW (binpath, PATH_SZ, L"\\bin");
        }
    }

  /* binpath is to the octave bin dir so get the parent */
  StringCchCopyW (path, PATH_SZ, binpath);
  ParentDir (path);

#ifdef SHOW_PATHS
  MessageBoxW (NULL, rootpath, L"octroot", MB_OK);
  MessageBoxW (NULL, path, L"octhome", MB_OK);
  MessageBoxW (NULL, binpath, L"octbin", MB_OK);
  MessageBoxW (NULL, msyspath, L"msysbin", MB_OK);
#endif

  /* qt paths
   * either %OCT_HOME%\qt5\plugins
   * or %OCT_HOME\plugins
   */
  nSize = lstrlenW (path);
  StringCchCatW (path, PATH_SZ, L"\\qt5\\plugins");
  SetEnvironmentVariableW (L"QT_PLUGIN_PATH", path);

  path[nSize] = L'\0';

  /* exe paths */
  {
#define PATHBUF_SZ 8096
    wchar_t pathbuffer[PATHBUF_SZ];
    wchar_t newpathbuffer[PATHBUF_SZ];

    nSize = GetEnvironmentVariableW (L"PATH", pathbuffer, PATHBUF_SZ-1);
    pathbuffer[nSize] = '\0';

    /* set our paths first */
    StringCchCopyW (newpathbuffer, PATHBUF_SZ, binpath);
    StringCchCatW (newpathbuffer, PATHBUF_SZ, L";");
    StringCchCatW (newpathbuffer, PATHBUF_SZ, msyspath);
    StringCchCatW (newpathbuffer, PATHBUF_SZ, L";");
    StringCchCatW (newpathbuffer, PATHBUF_SZ, pathbuffer);

    SetEnvironmentVariableW (L"PATH", newpathbuffer);
  }

  /* other env */
  SetEnvironmentVariableW (L"TERM", L"cygwin");
  SetEnvironmentVariableW (L"GNUTERM", L"wxt");
  SetEnvironmentVariableW (L"GS", L"gs.exe");

  /* home set */
  nSize = GetEnvironmentVariableW (L"HOME", path, PATH_SZ-1);
  if (nSize == 0 || path[0] == 0)
    {
      wchar_t newhome[PATH_SZ];

      nSize = GetEnvironmentVariableW (L"USERPROFILE", path, PATH_SZ-1);
      if (nSize == 0 || path[0] == 0)
        {
          /* build dir from drive and path */
          wchar_t tmpbuff[PATH_SZ];
          nSize = GetEnvironmentVariableW (L"HOMEDRIVE", tmpbuff, PATH_SZ-1);
          if (nSize)
            StringCchCopyW (path, PATH_SZ, tmpbuff);
          else
            path[0] = '\0';

          nSize = GetEnvironmentVariableW (L"HOMEPATH", tmpbuff, PATH_SZ-1);
          if (nSize)
            StringCchCopyW (path, PATH_SZ, tmpbuff);
        }

#ifdef NO_SHORT_PATH_NAMES
      StringCchCopyW (newhome, PATH_SZ, path);
#else
      /* transform to short paths to work around issues with spaces in
         paths */
      /* FIXME: This won't help on systems with de-activated short
         paths */
      nSize = GetShortPathNameW (path, newhome, PATH_SZ-1);

      if (nSize == 0)
        StringCchCopyW (newhome, PATH_SZ, path);
#endif

      SetEnvironmentVariableW (L"HOME", newhome);
    }

  /* check for gui mode */
  for (i = 1; i < argc; i++)
    {
      if (StrCmpW (argv[i], L"--no-gui-libs") == 0)
        {
          if (gui_arg_found)
            {
              /* Inconsistent options.  We can't start the GUI without gui libs.
                 How should we fail?   For now, --no-gui-libs will
                 override the other options.  */
            }

          no_gui_libs = 1;
        }
      else if (StrCmpW (argv[i], L"--gui") == 0
               || StrCmpW (argv[i], L"--force-gui") == 0)
        {
          if (no_gui_libs)
            {
              /* Inconsistent options.  We can't start the GUI without gui libs.
                 How should we fail?   For now, --no-gui-libs will
                 override the other options.  */
            }

          gui_arg_found = 1;
        }
      else if (StrCmpW (argv[i], L"--no-gui") == 0)
        no_gui_arg_found = 1;

      /* NOTE: specifying both --no-gui and --gui is also an
         inconsistent set of options but we leave it to octave.exe to
         detect that.  */
    }

#ifdef FIRST_TIME
  {
    /* change directory to USERPROFILE before starting Octave */
    wchar_t tmpbuff[PATH_SZ];
    nSize = GetEnvironmentVariableW (L"USERPROFILE", tmpbuff, PATH_SZ-1);
    if (nSize)
      StringCchCopyW (path, PATH_SZ, tmpbuff);

    SetCurrentDirectoryW (path);
  }
#endif

  /* set up process args and start it */
  {
    STARTUPINFO si;
#define ARGBUF_SZ 4096
    wchar_t argbuffer[ARGBUF_SZ];

    ZeroMemory (&si, sizeof (si));
    si.cb = sizeof (si);
    ZeroMemory (&pi, sizeof (pi));

    StringCchCopyW (path, PATH_SZ, binpath);

    StringCchCopyW (argbuffer, ARGBUF_SZ, L"octave.exe ");
    StringCchCatW (path, PATH_SZ, L"\\octave.exe");

    if (! (no_gui_libs || no_gui_arg_found))
      {
        /* Unless --no-gui or --no-gui-libs is specified, we will use a GUI window.  */
        si.dwFlags = STARTF_USESHOWWINDOW;

        /* If none of the options --no-gui, --gui, or --force-gui
           were specified, then we'll add --gui to start the gui as
           most Windows users would expect.  */

        if (! gui_arg_found)
          StringCchCatW (argbuffer, ARGBUF_SZ, L"--gui ");
      }

    /* quote and append each arg */
    for (i = 1; i < argc; i++)
      {
        StringCchCatW (argbuffer, ARGBUF_SZ, L"\"");
        StringCchCatW (argbuffer, ARGBUF_SZ, argv[i]);
        StringCchCatW (argbuffer, ARGBUF_SZ, L"\" ");
      }

    /* Start the child process */
    int status = CreateProcessW (path,      // Module name
                                 argbuffer, // Command line
                                 NULL,      // Process handle not inheritable
                                 NULL,      // Thread handle not inheritable
                                 FALSE,     // Set handle inheritance to FALSE
                                 0,         // No creation flags
                                 NULL,      // Use parent's environment block
                                 NULL,      // Use parent's starting directory
                                 &si,       // Pointer to STARTUPINFO
                                 &pi);      // Pointer to PROCESS_INFORMATION

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

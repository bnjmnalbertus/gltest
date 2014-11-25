module Paths_gltest (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/usr/home/benjamin/projects/gltest/.cabal-sandbox/bin"
libdir     = "/usr/home/benjamin/projects/gltest/.cabal-sandbox/lib/x86_64-freebsd-ghc-7.8.3/gltest-0.1.0.0"
datadir    = "/usr/home/benjamin/projects/gltest/.cabal-sandbox/share/x86_64-freebsd-ghc-7.8.3/gltest-0.1.0.0"
libexecdir = "/usr/home/benjamin/projects/gltest/.cabal-sandbox/libexec"
sysconfdir = "/usr/home/benjamin/projects/gltest/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "gltest_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "gltest_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "gltest_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "gltest_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "gltest_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)

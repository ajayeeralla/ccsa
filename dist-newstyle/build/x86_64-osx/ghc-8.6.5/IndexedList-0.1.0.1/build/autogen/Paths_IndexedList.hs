{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_IndexedList (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/aeeralla/.cabal/bin"
libdir     = "/Users/aeeralla/.cabal/lib/x86_64-osx-ghc-8.6.5/IndexedList-0.1.0.1-inplace"
dynlibdir  = "/Users/aeeralla/.cabal/lib/x86_64-osx-ghc-8.6.5"
datadir    = "/Users/aeeralla/.cabal/share/x86_64-osx-ghc-8.6.5/IndexedList-0.1.0.1"
libexecdir = "/Users/aeeralla/.cabal/libexec/x86_64-osx-ghc-8.6.5/IndexedList-0.1.0.1"
sysconfdir = "/Users/aeeralla/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "IndexedList_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "IndexedList_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "IndexedList_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "IndexedList_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "IndexedList_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "IndexedList_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
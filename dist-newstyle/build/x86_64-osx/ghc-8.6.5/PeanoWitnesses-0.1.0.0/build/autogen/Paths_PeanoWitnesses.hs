{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_PeanoWitnesses (
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/aeeralla/.cabal/bin"
libdir     = "/Users/aeeralla/.cabal/lib/x86_64-osx-ghc-8.6.5/PeanoWitnesses-0.1.0.0-inplace"
dynlibdir  = "/Users/aeeralla/.cabal/lib/x86_64-osx-ghc-8.6.5"
datadir    = "/Users/aeeralla/.cabal/share/x86_64-osx-ghc-8.6.5/PeanoWitnesses-0.1.0.0"
libexecdir = "/Users/aeeralla/.cabal/libexec/x86_64-osx-ghc-8.6.5/PeanoWitnesses-0.1.0.0"
sysconfdir = "/Users/aeeralla/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "PeanoWitnesses_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "PeanoWitnesses_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "PeanoWitnesses_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "PeanoWitnesses_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "PeanoWitnesses_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "PeanoWitnesses_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)

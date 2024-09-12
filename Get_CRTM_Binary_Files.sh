#https://bin.ssec.wisc.edu/pub/s4/CRTM/fix_REL-3.1.1.2.tgz  (use this for jedi and stand-alone, some files have changed).

# This script is used to manually download the tarball of binary and netcdf coefficient files.
# The same files also download automatically during the cmake step, so you don't have to actually run this manually. 

foldername="fix_REL-3.1.1.2"
filename="${foldername}.tgz"
http_file_path="https://bin.ssec.wisc.edu/pub/s4/CRTM/${filename}"
http_file_checksum="https://bin.ssec.wisc.edu/pub/s4/CRTM/${filename}.md5sum"
downloaded_location=""
echo "$filename"
break

# Case: file is already downloaded and unzipped.
if test -f "$filename"; then
    if [ -d "fix/" ]; then #fix directory exists
        echo "fix/ already exists, doing nothing."
    else
        #untar the file and move directory to fix
        tar -zxvf $filename
        mv $foldername/fix .
        rm -rf $foldername
        echo "fix/ directory created from existing $filename file."
    fi
    exit 0
fi

# Case: CRTM test data exists and has been loaded somewhere in the environment. In this
# case we validate that the local data has the same md5 sum as the remote before continuing.
if [ -n "$CRTM_BINARY_FILES_TARBALL" ]; then
    local_md5=$(md5sum $CRTM_BINARY_FILES_TARBALL | cut -d ' ' -f 1)
    canonical_md5=$(curl -0  ftp://bin.ssec.wisc.edu/pub/s4/CRTM//fix_REL-3.1.1.2.tgz.md5sum | cut -d ' ' -f 1)
    if [ $local_md5 = $canonical_md5 ]; then
        downloaded_location=$CRTM_BINARY_FILES_TARBALL
    else
        echo "environment specified CRTM_BINARY_FILES_TARBALL has non-matching md5 sum"
    fi
fi

# Case: no local files are found. Download the official files.
if [ -z "$downloaded_location" ]; then
    echo "Downloading $filename, please wait about 7 minutes (7 GB tar file: sorry!)"
    wget $http_file_path # CRTM binary files, add "-q" to suppress output.
    downloaded_location=$filename
fi
			
#Untar the file and move directory to fix.
tar -zxvf $filename
mkdir fix
mv $foldername/fix/* fix/.
rm -rf $foldername
echo "fix/ directory created from downloaded $filename."
fi
echo "Completed."

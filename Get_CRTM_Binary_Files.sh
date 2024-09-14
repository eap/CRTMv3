#https://bin.ssec.wisc.edu/pub/s4/CRTM/fix_REL-3.1.1.2.tgz  (use this for jedi and stand-alone, some files have changed).

# This script is used to manually download the tarball of binary and netcdf coefficient files.
# This script is used by cmake to load the files but it can also be used manually.

# Default values for flags.
crtm_coeffs_branch="fix_REL-3.1.1.2"
http_base_path="https://bin.ssec.wisc.edu/pub/s4/CRTM/"
checksum="58e0a5c698a438a31dc4914fcda39846"
crtm_source_dir="${PWD}"
download_location=""
untar_dest=""
echo "$filename"


# Help function
function usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  --http_base_path     Path to the HTTP file (default: $http_base_path)"
    echo "  --crtm_coeffs_branch CRTM coefficients branch (default: $crtm_coeffs_branch)"
    echo "  --crtm_source_dir    Path of the source directory for CRTMv3 (default: ${crtm_source_dir}."
    echo "  --checksum           Checksum value (default: $checksum)"
    echo "  --download_location  Path to where the CRTM file should be downloaded."
    echo "  -h, --help           Show this help message"
    exit 1
}

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        --http_base_path)
            http_base_path="$2"
            shift 2
            ;;
        --crtm_coeffs_branch)
            crtm_coeffs_branch="$2"
            shift 2
            ;;
        --crtm_source_dir)
            crtm_source_dir="$2"
            shift 2
            ;;
        --checksum)
            checksum="$2"
            shift 2
            ;;
        --download_location)
            download_location="$2"
            shift 2
            ;;
        --untar_dest)
            untar_dest="$2"
            shift 2
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo "Unknown option: $1"
            usage
            ;;
    esac
done


set -x
# Runtime values derived from from flags and flag default values.
filename="${crtm_coeffs_branch}.tgz"
http_file_path="${http_base_path}/${filename}"

# Reiterate flag settings for stderr output.
crtm_coeffs_branch=$crtm_coeffs_branch
http_base_path=$http_base_path
checksum=$checksum
crtm_source_dir=$crtm_source_dir
download_location=$download_location
untar_dest=$untar_dest

# If no download location is passed by flag, just use the expected file name.
if [ -z "$download_location" ]; then
    download_location=$filename
fi
if [ -z "$untar_dest" ]; then
    untar_dest="${crtm_source_dir}"
fi


# Determine if CRTM is already present in the source directory.
if [ -d "$crtm_source_dir/fix" ]; then
    echo "Found CRTM coefficients in the source directory"
    exit 0
fi

if [ -d "${untar_dest}/${crtm_coeffs_branch}/fix" ]; then
    echo "Found CRTM coefficients in the source directory"
    exit 0
fi

# Check if there's a local copy on the system whose md5 matches the expected
# md5 checksum. If this is found, override $download_location so that later
# unzipping will use this file.
if [ -f "$CRTM_BINARY_FILES_TARBALL" ]; then
    local_md5=$(md5sum $CRTM_BINARY_FILES_TARBALL | cut -d ' ' -f 1)
    if [ $local_md5 = $checksum ]; then
        download_location=$CRTM_BINARY_FILES_TARBALL
    fi
fi

if [ ! -f "$download_location" ]; then
    wget $http_file_path -O $download_location
fi

tar -zxvf $download_location -C "${untar_dest}"

if [ ${untar_dest} = $PWD ]; then
    mv $crtm_coeffs_branch/fix .
    rm -rf $crtm_coeffs_branch
    echo "fix/ directory created in the CRTMv3 source directory from $download_location."
fi

exit 0

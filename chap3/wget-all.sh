wget_list=www.linuxfromscratch.org/lfs/downloads/7.9/wget-list
md5sums=www.linuxfromscratch.org/lfs/downloads/7.9/md5sums
sources=$LFS/sources

run_wget()
{
   wget $* --directory-prefix=$sources
}

if [ "X$LFS" = "X" ]; then
    echo "LFS is not set"
    exit -1
fi

mkdir -v $sources
# Make the source sticky
chmod -v a+wt $sources
wget $wget_list
run_wget $md5sums
run_wget --input-file=wget-list --continue

pushd $sources
md5sum -c md5sums
popd

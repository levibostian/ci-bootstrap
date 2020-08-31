# Google Cloud - Cloud Storage

# Scripts

### CRC32C install

If you are using `gsutil` on your machine to download files from Google Cloud, Cloud Storage, it's recommended that you run this script. It will install the native C module version of `crcmod`. `gsutil` comes with a pure Python version but that version is slow and `gsutil` may throw an error without having the native version installed. 

To learn more, read the [official doc](https://cloud.google.com/storage/docs/gsutil/addlhelp/CRC32CandInstallingcrcmod) and read the install script in this project. 
CheckSig=$(sha256sum --ignore-missing --check SHA256SUMS.asc | grep 'bitcoin-0.21.0-x86_64-linux-gnu.tar.gz: OK' -c)
gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 01EA5486DE18A882D4C2684590C8019E36C2E964
goodSignature=$(gpg --verify SHA256SUMS.asc 2>&1 | grep 'Good signature' -c)

if [ ${CheckSig} -eq 1 ] && [ ${goodSignature} -eq 1 ]
then
  touch ~/yeticold/sigcorrect
fi

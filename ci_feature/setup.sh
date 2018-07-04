TMPDIR="/opt"
cd $TMPDIR

wget https://github.com/Microsoft/OMS-Agent-for-Linux/releases/download/OMSAgent_v1.6.0-42/omsagent-1.6.0-42.universal.x64.sh

#create file to disable omi service startup script
touch /etc/.omi_disable_service_control
https://rashmi.blob.core.windows.net/bld-docker-image-4-41-pm/docker-cimprov-1.0.0-33.universal.x86_64.sh
chmod 775 $TMPDIR/*.sh

#Extract omsbundle
$TMPDIR/omsagent-*.universal.x64.sh --extract
mv $TMPDIR/omsbundle* $TMPDIR/omsbundle
#Install omi
/usr/bin/dpkg -i $TMPDIR/omsbundle/100/omi*.deb

#Install scx
/usr/bin/dpkg -i $TMPDIR/omsbundle/100/scx*.deb
#$TMPDIR/omsbundle/bundles/scx-1.6.*-*.universal.x64.sh --install

#Install omsagent and omsconfig

/usr/bin/dpkg -i $TMPDIR/omsbundle/100/omsagent*.deb
/usr/bin/dpkg -i $TMPDIR/omsbundle/100/omsconfig*.deb
#/$TMPDIR/omsbundle/oss-kits/docker-cimprov-1.0.0-*.x86_64.sh --install
#Use downloaded docker-provider instead of the bundled one

/$TMPDIR/docker-cimprov-1.0.0-*.x86_64.sh --install

rm -rf $TMPDIR/omsbundle
rm -f $TMPDIR/omsagent*.sh
rm -f $TMPDIR/docker-cimprov*.sh

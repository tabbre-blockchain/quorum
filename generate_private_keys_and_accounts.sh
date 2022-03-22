#Set time stamp
t=`date +%s`
#set up date dir for geth
rootDir=`pwd`"/$t/"

#Set up logfile file
logFile="account.log."$t
#Set up account list file
f="account.list."$t
dataDir=$rootDir"/ethereum_accounts"
keystoreFiles=$dataDir"/keystore/*"
keystore=$dataDir"/keystore/"
wip=$dataDir"/wip/"
newAccounts=$dataDir"/new/"
ethereumPassword="/tmp/"$t
echo "charles" > $ethereumPassword

mkdir $rootDir
mkdir $dataDir
mkdir $keystore
mkdir $wip
mkdir $newAccounts

# goto WIP
cd $wip
# create new account.list
echo > $f


# create private keys
echo "create private keys"
for i in 0 1 2 3 4 5 6 7 8 9
	do
	for j in  0 1 2 3 4 5 6 7 8 9
		do
		# make the private key
		openssl ecparam -name secp256k1 -genkey -noout | openssl ec -text -noout | grep ^\  | head -n3 | tr -d '\n[:space:]:' | sed 's/^04//' >key.$t.$i$j
		done
	done
# remove keys starting with 00
echo "remove keys starting with 00"
rm `grep -l ^00 key.*`
# generate accounts
echo "generate accounts at "`pwd`
for i in `ls | grep ^key.$t`
	do
	logEntry=$i","`cat $i`
	#echo $i
	#echo $i >>$f
	#cat $i  >>$f
	#echo  >>$f
	gethResult=`geth  --datadir $dataDir  --password $ethereumPassword account import $i`
	
	echo  $logEntry","$gethResult >>$f
	
	done


mv $keystoreFiles .

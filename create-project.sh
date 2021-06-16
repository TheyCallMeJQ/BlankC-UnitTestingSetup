if [ "$#" -lt 1 ] || [ $1 == "-h" ] || [ $1 == "--h" ] || [ $1 == "--help" ] ; then 
   printf "This script should be used as follows:\n\t $0 -p [PROJECT NAME] -c [CLASS NAME]\n\t $0 -c [CLASS NAME]\nWhere\n\t-c: Class name\n\t-p: Project name" 
   exit
fi

while getopts c:p: option 
   do
      case "${option}" in
         p) PROJECT=${OPTARG};;
         c) CLASS=${OPTARG};;
         ?) exit;;
      esac
   done

if [ -n "$PROJECT" ] && [ -n "$CLASS" ] ; then
	dotnet new sln -o $PROJECT
    cd $PROJECT
    dotnet new console -o $CLASS
    dotnet sln add ./$CLASS/$CLASS.csproj
    dotnet new xunit -o $CLASS.Tests
    dotnet add ./$CLASS.Tests/$CLASS.Tests.csproj reference ./$CLASS/$CLASS.csproj
    dotnet sln add ./$CLASS.Tests/$CLASS.Tests.csproj
	
	exit 0 
fi
if [ -n "$CLASS" ] ; then 
	dotnet new sln -o new-project
    cd new-project
    dotnet new console -o $CLASS
    dotnet sln add ./$CLASS/$CLASS.csproj
    dotnet new xunit -o $CLASS.Tests
    dotnet add ./$CLASS.Tests/$CLASS.Tests.csproj reference ./$CLASS/$CLASS.csproj
    dotnet sln add ./$CLASS.Tests/$CLASS.Tests.csproj
	
    exit 0
fi
if [ -n "$PROJECT" ] ; then 
   echo "Only project is set to $PROJECT, please specify a class" ;
   exit 1
fi




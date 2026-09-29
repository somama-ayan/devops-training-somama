ux@fedora:~/devops-lab$ cat lab-check.sh 
#!/usr/bin/env bash


failed=0
checkTool(){

	tool="$1"
	if command -v $tool > /dev/null 
		then
			shift
			"$tool" "$@"
	else
		echo "$tool not Found!"
		failed=1
	fi
}

checkTool docker --version
checkTool kubectl version --client
checkTool minikube version
checkTool k3d --version
checkTool terraform version
checkTool ansible --version
checkTool localstack --version
checkTool gh --version


exit "$failed"

pipeline {
    agent any
    stages {
        stage('Install') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/develop']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/Aaquiff/utPLSQL.git']]])
                dir('source') {
                    bat 'sqlplus sys/Manager_1@cmbrndsb3812/pdb1 as sysdba @install_headless.sql'
                }
            }
        }
        stage('test') {
            steps {
                dir('C:\\utPLSQL-cli\\bin') {
                    bat 'utplsql run ifsapp/ifsapp@cmbrndsb3812:1521/pdb1 -f=UT_JUNIT_REPORTER -o=result.xml'
                }
            }
        }
        stage('Uninstall') {
            steps {
                dir('source') {
                    bat 'sqlplus sys/Manager_1@cmbrndsb3812/pdb1 as sysdba @uninstall_all.sql UT3'
                }
            }
        }
        stage('CLean Workspace'){
            steps{
                deleteDir()           
            }
        }
    }
}
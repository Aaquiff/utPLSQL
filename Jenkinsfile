pipeline {
    agent any
    stages {
        stage('Install') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/develop']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/Aaquiff/utPLSQL.git']]])
                dir('source') {
                    bat 'sqlplus sys/Manager_1@cmbrndsb3812/sb as sysdba @install_headless.sql'
                }
            }
        }
        stage('test') {
            steps {
                dir('utPLSQL-cli/bin'){
                    bat 'utplsql run ifsapp/ifsapp@cmbrndsb3812:1521/sb -f=UT_JUNIT_REPORTER -o=result.xml'
                }
            }
        }
        stage('Uninstall') {
            steps {
                dir('source') {
                    bat 'sqlplus sys/Manager_1@cmbrndsb3812/sb as sysdba @uninstall_all.sql UT3'
                }
            }
        }
        stage ('Generate Test results') {
            steps {
                dir('utPLSQL-cli/bin') {
                    junit allowEmptyResults: true, testResults: 'result.xml'
                }
            }
        }
        stage('Clean Workspace'){
            steps{
                deleteDir()           
            }
        }
    }
}
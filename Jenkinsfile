pipeline {
    agent any // �������� Jenkins ������, �� ������� ����� ����������� ������: ��� ����� �����

    triggers {
        pollSCM('H/5 * * * *') // ��������� ����� ������������� �� ����� �������� ��� � 5 �����
    }

    tools {
        maven 'maven-3.8.1' // ��� ������ ������� ����� Maven
        jdk 'jdk16' // � Java Developer Kit ������ ������
        nodejs 'node-16' // � NodeJS ����� ��� ������
    }

    stages {
        stage('Build & Test backend') {
            steps {
                dir("backend") { // ��������� � ����� backend
                    sh 'mvn package' // �������� ������� ������
                }
            }

            post {
                success {
                    junit 'backend/target/surefire-reports/**/*.xml' // ��������� ���������� ������ � Jenkins
                }
            }
        }

        stage('Build frontend') {
            steps {
                dir("frontend") {
                    sh 'npm install' // ��� ������ ������� �������� ��� ��������� �����������
                    sh 'npm run build' // �������� ������
                }
            }
        }
        
        stage('Save artifacts') {
            steps {
                archiveArtifacts(artifacts: 'backend/target/sausage-store-0.0.1-SNAPSHOT.jar')
                archiveArtifacts(artifacts: 'frontend/dist/frontend/*')
            }
        }

        stage('Slack POST') {
            steps {
            	curl -X POST -H 'Content-type: application/json' --data '{"text":"**��������� ���������** ������ ����������."}' https://***REMOVED***
            }
        }
    }
}
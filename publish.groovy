def buildNpmrc = {
  withCredentials([
    usernamePassword(credentialsId: 'artifactory-jenkins-user', usernameVariable: 'NPM_USER', passwordVariable: 'NPM_PASSWORD')
  ]) {
    sh './provision/build_npmrc.sh'
  }
}

pipeline {
  agent any
  stages {
    stage ('publish package') {
      agent any
      steps {
        script {
          def scmVars = checkout scm
          withCredentials([
            usernamePassword(credentialsId: 'artifactory-jenkins-user', usernameVariable: 'NPM_USER', passwordVariable: 'NPM_PASSWORD')
          ]) {
            sh './provision/build_npmrc.sh'
          }
          sh 'npm publish'
        }
      }
    }
  }
  post {
    always {
      deleteDir()
    }
  }
}

def commit_id
pipeline{
        agent any
        stages {
            stage('preparation'){
                steps {
                    checkout scm
                    sh "git rev-parse --short HEAD > .git/commit-id"
                    script {
                        commit_id = readFile('.git/commit-id').trim()
                    }
                }
            }
        

     
            stage('build'){
                steps {
                    echo 'building maven workload'
                    sh "mvn clean install"
                    echo "build complete"
                }
            }

            stage('image build'){
                steps {
                    echo 'building docker  image'
                    sh "docker build -t position-simulator:${commit_id} ."
                    echo "docker image built"
                }
            }
            stage('deploy'){
                steps {
node {
  withCredentials([string(credentialsId: '11c6527f675368af08293d7c565b6214fd', variable: 'TOKEN')]) {
    sh '''
      set +x
      curl -H "Token: $TOKEN" https://some.api/
    '''
  }
}
		    sh "docker login -u 'dora12334' -p '~H2ff/tDqNW7Bi?'"
                    sh "sed -i -r 's|richardchesterwood/k8s-fleetman-position-simulator:release2|position-simulator:${commit_id}|' ./workloads.yaml"
                    sh "kubectl apply -f workloads.yaml --token $TOKEN_FROM_WITH_CREDENTIALS"
                }
            }


        }


}

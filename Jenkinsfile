def release(){

    return {
        if (currentBuild.result == "SUCCESS"){
            unstash 'git checkout'
            image_name = env.DOCKER_REGISTRY_HOST + '/' + env.DOCKER_IMAGE_NAME + ':' + env.DOCKER_IMAGE_TAG
            docker.image(image_name).inside("-e BRANCH_NAME") {
                sh 'mkdir ./release/'
                sh 'cp /recipes/docker/pkg/*.rpm ./release/'
            }
            sh 'echo upload to artifactory'
            deleteDir()
        }
    }
}

uacf_generic_pipeline {
    publish_branches = ['master', 'develop']
    release_branches = ['master']
    images = [
        fpmrecipes: [
            SLAVE: "swarm",
            DOCKER_IMAGE_NAME: "infra/fpm-recipes",
            DOCKER_CONTEXT_PATH: ".",
            DOCKER_FILE: "./Dockerfile"
        ]
    ]
    release = release()
}

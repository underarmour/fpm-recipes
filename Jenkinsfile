def release(){

    return {
        if (currentBuild.result == "SUCCESS"){
            docker.image("infra/docker-engine:v1.12.3").inside("--privileged -v /var/run/docker.sock:/var/run/docker.sock") {
                sh './hack/make.sh binary'
                // TODO: figure out how to copy out the bits here to use in the fpm-recipes image
            }

            image_name = env.DOCKER_REGISTRY_HOST + '/' + env.DOCKER_IMAGE_NAME + ':' + env.DOCKER_IMAGE_TAG
            docker.image(image_name).inside("-e ARTIFACTORY_USERNAME -e ARTIFACTORY_PASSWORD") {
                sh 'curl -u ${ARTIFACTORY_USERNAME}:${ARTIFACTORY_PASSWORD} --upload-file /recipes/docker/pkg/*.rpm https://repo.uacf.io/artifactory/yum-uacf/amzn/latest/x86_64/'
                sh 'curl -u ${ARTIFACTORY_USERNAME}:${ARTIFACTORY_PASSWORD} -X POST https://repo.uacf.io/artifactory/api/yum/yum-uacf?async=1'
            }
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
        ],
        dockerbuild: [
            SLAVE: "swarm",
            DOCKER_IMAGE_NAME: "infra/docker-engine",
            DOCKER_CONTEXT_PATH: ".",
            DOCKER_FILE: "./Dockerfile",
            DOCKER_TAGS: "v1.12.3"
        ]

    ]
    release = release()
}

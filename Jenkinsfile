def release(){
    return {
        sh 'cd docker'
        sh 'make'
        step([$class: 'ArtifactArchiver', artifacts: '**/pkg/*.rpm', fingerprint: true])
        step([$class: 'ArtifactArchiver', artifacts: '**/pkg/*.deb', fingerprint: true])
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

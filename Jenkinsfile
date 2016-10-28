node {
    sh 'cd docker && make'
    step([$class: 'ArtifactArchiver', artifacts: '**/pkg/*.rpm', fingerprint: true])
    step([$class: 'ArtifactArchiver', artifacts: '**/pkg/*.deb', fingerprint: true])
}

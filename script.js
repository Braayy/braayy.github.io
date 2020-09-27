Vue.component('project', {
    props: [ 'project' ],

    template: `
        <a v-bind:href="project.url" target="_blank">
            <div class="project">
                <img v-bind:src="$root.getImageUrl(project.name, project.imageName)" />    
                <div class="header">
                    <h1>{{ project.name }}</h1>
                    <h2>{{ project.description }}</h2>
                    <br />
                    <a v-bind:href="$root.getDownloadUrl(project.name, project.latestVersion)">Download</a>
                </div>
            </div>
        </a>
    `
});

const vue = new Vue({
    el: '.root',
    data: {
        projects: [
            {
                name: 'bBans',
                description: 'A simple ban/mute plugin',
                imageName: 'ban.gif',
                url: 'https://github.com/braayy/bBans',
                latestVersion: '1.0'
            },
            {
                name: 'bPets',
                description: 'A pets plugin for Paper 1.12',
                imageName: 'pets.gif',
                url: 'https://github.com/braayy/bPets',
                latestVersion: '1.0'
            },
            {
                name: 'bLobby',
                description: 'A lobby plugin for Paper 1.12',
                imageName: 'lobby.gif',
                url: 'https://github.com/braayy/bLobby',
                latestVersion: '1.0'
            },
            {
                name: 'bChat',
                description: 'A chat management plugin for Paper 1.12',
                imageName: 'chat_regional.gif',
                url: 'https://github.com/braayy/bChat',
                latestVersion: '1.0'
            },
            {
                name: 'bSpawner',
                description: 'A simple spawner command plugin',
                imageName: 'spawner.gif',
                url: 'https://github.com/braayy/bSpawner',
                latestVersion: '1.0'
            }
        ]
    },
    methods: {
        getImageUrl(name, imageName) {
            return `https://raw.githubusercontent.com/Braayy/${name}/master/gifs/${imageName}`
        },
        getDownloadUrl(name, latestVersion) {
            return `https://github.com/Braayy/${name}/releases/download/v${latestVersion}/${name}-${latestVersion}.jar`
        }
    }
});
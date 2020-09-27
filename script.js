Vue.component('project', {
    props: [ 'project' ],

    template: `
        <a v-bind:href="project.url" target="_blank">
            <article>
                <img v-bind:src="project.imageUrl" />    
                <header>
                    <h1>{{ project.name }}</h1>
                    <h2>{{ project.description }}</h2>
                </header>
            </article>
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
                imageUrl: 'file:///home/braayy/workspace/bBans/gifs/ban.gif',
                url: 'https://github.com/braayy/bBans'
            },
            {
                name: 'bPets',
                description: 'A pets plugin for Paper 1.12',
                imageUrl: 'file:///home/braayy/workspace/bPets/gifs/pets.gif',
                url: 'https://github.com/braayy/bPets'
            },
            {
                name: 'bLobby',
                description: 'A lobby plugin for Paper 1.12',
                imageUrl: 'file:///home/braayy/workspace/bLobby/gifs/lobby.gif',
                url: 'https://github.com/braayy/bLobby'
            },
            {
                name: 'bChat',
                description: 'A chat management plugin for Paper 1.12',
                imageUrl: 'file:///home/braayy/workspace/bChat/gifs/chat_regional.gif',
                url: 'https://github.com/braayy/bChat'
            },
            {
                name: 'bSpawner',
                description: 'A simple spawner command plugin',
                imageUrl: 'file:///home/braayy/workspace/bSpawner/gifs/spawner.gif',
                url: 'https://github.com/braayy/bSpawner'
            }
        ]
    }
});
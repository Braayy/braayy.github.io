record Project {
  name : String,
  description : String,
  version : String,
  minecraftVersion : String,
  githubUrl : String,
  imageUrl : String
}

/*
[
  {
    "name": "bBans",
    "description": "A simple ban/mute plugin",
    "imageName": "ban.gif",
    "url": "https://github.com/braayy/bBans",
    "latestVersion": "1.0"
  },
  {
    "name": "bPets",
    "description": "A pets plugin for Paper 1.12",
    "imageName": "pets.gif",
    "url": "https://github.com/braayy/bPets",
    "latestVersion": "1.0"
  },
  {
    "name": "bLobby",
    "description": "A lobby plugin for Paper 1.12",
    "imageName": "lobby.gif",
    "url": "https://github.com/braayy/bLobby",
    "latestVersion": "1.0"
  },
  {
    "name": "bChat",
    "description": "A chat management plugin for Paper 1.12",
    "imageName": "chat_regional.gif",
    "url": "https://github.com/braayy/bChat",
    "latestVersion": "1.0"
  },
  {
    "name": "bSpawner",
    "description": "A simple spawner command plugin",
    "imageName": "spawner.gif",
    "url": "https://github.com/braayy/bSpawner",
    "latestVersion": "1.0"
  }
]
*/

store Store.Projects {
  state projects : Array(Project) = [
    {
      name = "bBans",
      description = "A simple ban/mute plugins",
      version = "1.0",
      minecraftVersion = "PaperMC 1.12",
      githubUrl = "https://github.com/Braayy/bBans/",
      imageUrl = "https://raw.githubusercontent.com/Braayy/bBans/master/gifs/ban.gif"
    },
    {
      name = "bPets",
      description = "A pets plugin for Paper 1.12",
      version = "1.0",
      minecraftVersion = "PaperMC 1.12",
      githubUrl = "https://github.com/braayy/bPets",
      imageUrl = "https://raw.githubusercontent.com/Braayy/bPets/master/gifs/pets.gif"
    },
    {
      name = "bLobby",
      description = "A lobby plugin for Paper 1.12",
      version = "1.0",
      minecraftVersion = "PaperMC 1.12",
      githubUrl = "https://github.com/braayy/bLobby",
      imageUrl = "https://raw.githubusercontent.com/Braayy/bLobby/master/gifs/lobby.gif"
    },
    {
      name = "bChat",
      description = "A chat management plugin for Paper 1.12",
      version = "1.0",
      minecraftVersion = "PaperMC 1.12",
      githubUrl = "https://github.com/braayy/bChat",
      imageUrl = "https://raw.githubusercontent.com/Braayy/bChat/master/gifs/chat_regional.gif"
    },
    {
      name = "bSpawner",
      description = "A simple spawner command plugin",
      version = "1.0",
      minecraftVersion = "PaperMC 1.12",
      githubUrl = "https://github.com/braayy/bSpawner",
      imageUrl = "https://raw.githubusercontent.com/Braayy/bSpawner/master/gifs/spawner.gif"
    }
  ]
}

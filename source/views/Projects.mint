component View.Projects {
  connect Store.Projects exposing { projects }

  fun getDownloadLink(project : Project) {
    "https://github.com/Braayy/#{project.name}/releases/download/v#{project.version}/#{project.name}-#{project.version}.jar"
  }

  fun render : Html {
    <div::container>
      <div::projects>
        for (project of projects) {
          <div::project>
            /* <img src={project.imageUrl} /> */
            <h1>"#{project.name} v#{project.version}"</h1>
            <h2><{ project.description }></h2>
            <p>"Minecraft Version: #{project.minecraftVersion}"</p>
            /* <p><{ project.minecraftVersion }></p> */
            <div::project-actions>
              <a href={getDownloadLink(project)} target="_blank">
                <Feather icon={Icon::Download} />
              </a>
              <a href={project.githubUrl} target="_blank">
                @svg(../../assets/icons/github.svg)
              </a>
            </div>
          </div>
        }
      </div>
    </div>
  }

  style container {
    width: 100%;
    min-height: 100vh;

    display: flex;
    justify-content: center;
  }

  style projects {
    width: 80%;
    min-height: 100%;

    padding: .5rem;

    display: grid;
    grid-template-rows: 1fr 1fr;
    grid-template-columns: 1fr 1fr 1fr;
    grid-gap: .5rem;
  }

  style project {
    width: 100%;
    height: fit-content;

    display: flex;
    flex-direction: column;
    justify-content: space-around;
    align-items: center;
    
    padding: 1rem;
    background: rgba(var(--secondary-rgb), 0.5);

    border-radius: 1.25rem;

    img {
      width: 100%;
      height: 8rem;

      border-radius: .5rem;
    }

    h1 {
      margin: .25rem 0;
      font-size: 1.3rem;

      text-align: center;
    }

    h2 {
      margin: .25rem 0;
      font-size: 1rem;

      text-align: center;
    }

    p {
      margin: .25rem 0;
      font-size: 1rem;
    }
  }

  style project-actions {
    width: 100%;

    display: flex;
    justify-content: space-around;
    align-items: center;

    margin-top: 1rem;

    a {
      width: 2.5rem;
      height: 2.5rem;
      border-radius: 50%;
      padding: .25rem;

      background: var(--secondary);

      cursor: pointer;

      svg {
        width: 100%;
        height: 100%;

        &:hover {
          filter: brightness(80%);
        }
      }

      &:first-child {
        svg {
          stroke: var(--text);
        }
      }

      &:last-child {
        svg {
          fill: var(--text);
        }
      }
    }
  }
}

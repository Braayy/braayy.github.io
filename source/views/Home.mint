component View.Home {
  fun render : Html {
    <div::home>
      <div::presentation>
        <h1>"Brayan Gomes"</h1>
        <h2>"Braayy"</h2>

        <p>"Minecraft and Javascript Developer"</p>
      </div>
      <div::media>
        <div>
          @svg(../../assets/icons/twitter.svg)
          <p>"@braayy_dev"</p>
        </div>
        <div>
          @svg(../../assets/icons/discord.svg)
          <p>"Braayy#8929"</p>
        </div>
      </div>
    </div>
  }

  style home {
    width: 100%;
    min-height: 100vh;

    display: flex;
    justify-content: center;
    align-items: center;
  }

  style presentation {
    > * {
      width: 100%;
      text-align: center;
    }

    h1 {
      font-weight: 400;
      font-size: 3rem;
    }

    h2 {
      font-weight: 300;
      font-size: 2rem;

      margin-bottom: 2rem;
    }

    p {
      font-size: 1.5rem;
    }
  }

  style media {
    position: fixed;
    bottom: 2rem;
    left: 50%;
    transform: translateX(-50%);

    display: flex;
    justify-content: space-around;
    align-items: center;

    div {
      display: flex;
      align-items: center;

      svg {
        fill: var(--text);

        margin-right: .25rem;
      }

      p {
        font-size: 1.2rem;
      }

      &:first-child {
        margin-right: 2rem;
      }
    }
  }
}

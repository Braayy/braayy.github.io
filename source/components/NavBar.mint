component NavBar {
  connect Router exposing { page, setPage }

  fun handleHome {
    setPage(Page::Home)
  }

  fun handleProjects {
    setPage(Page::Projects)
  }

  fun render : Html {
    <nav::navBar>
      <span::navItem(Page::Home) onClick={handleHome}>
        <Feather icon={Icon::Home} />
      </span>
      <span::navItem(Page::Projects) onClick={handleProjects}>
        <Feather icon={Icon::List} />
      </span>
    </nav>
  }

  style navBar {
    width: 3.5rem;
    height: fit-content;

    position: fixed;
    top: 50%;
    left: .5rem;
    transform: translateY(-50%);

    background: rgba(var(--secondary-rgb), 0.5);
    border-radius: 1.25rem;
    padding: .5rem;

    display: flex;
    flex-direction: column;
    justify-content: space-around;
    align-items: center;

    span:first-child {
      margin-bottom: .5rem;
    }
  }

  style navItem(itemPage : Page) {
    width: 2rem;
    height: 2rem;

    cursor: pointer;
    transition: filter .15s;

    &:hover {
      filter: brightness(80%);
    }

    svg {
      width: 100%;
      height: 100%;

      if (page == itemPage) {
        stroke: var(--action);
      } else {
        stroke: var(--text);
      }
    }
  }
}

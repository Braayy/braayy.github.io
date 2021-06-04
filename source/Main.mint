component Main {
  connect Router exposing { page }

  fun render : Html {
    <>
      <NavBar />

      case (page) {
        Page::Home => <View.Home />
        Page::Projects => <View.Projects />
      }
    </>
  }
}

<page-list>
  <div class="ui middle aligned divided list">
    <div class="item" each={ page, key in opts.current.champ_data.pages }>
      <div class="right floated content" data-key={ key }>
        <div class="ui icon button disabled">
          <i class="upload icon"></i>
        </div>
        <div class="ui icon button" onclick={ setFav } data-key={key}>
          <i class={ key == opts.current.champ_data.fav ? "heart icon" : "empty heart icon" } data-key={key}></i>
        </div>
        <div class="ui icon button" data-key={key} onclick={ deletePage }>
          <i class="remove icon" data-key={key}></i>
        </div>
      </div>
      <div class="middle aligned content">
        {key}
        <img each={ rune, index in page.selectedPerkIds } class="ui image avatar" style={index == 0 ? "width: 52px; height: 52px;" : ""} src=./resources/runesReforged/perk/{rune}.png>
      </div>
    </div>
  </div>

  <script>

    setFav(evt) {
      evt.preventUpdate = true;
      
      var page = $(evt.target).data("key");
      freezer.emit("page:fav", opts.current.champion, page);
    }

    deletePage(evt) {
      evt.preventUpdate = true;

      var page = $(evt.target).data("key");
      freezer.emit("page:delete", opts.current.champion, page);
    }
  
  </script>

</page-list>
{
  programs.wofi = {
    enable = true;

    settings = {
      width = 640;
      height = 480;
      location = "center";
      show = "drun";
      matching = "fuzzy";
      prompt = "Search...";
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 32;
      gtk_dark = false;
      term = "kitty";
    };

    style = ''
      * {
        transition: 0.2s;
      }

      window {
        font-family: JetBrainsMono;
      	font-size: 14px;
      }

      window {
          margin: 0px;
          border: 2px solid #6791C9;
          background-color: rgba(18, 18, 18, 0.5);
          border-radius: 12px;
      }

      #input {
          padding: 2px;
          margin: 20px;
          padding-left: 20px;
          border: #595959 2px solid;
          color: #F2F4F5;
          font-weight: bold;
          background: rgba(29, 29, 29, 0.6);
          outline: none;
          border-radius: 16px;
      }

      #input image {
          color: #fff;
      }

      #input:focus {
          border: #6791C9 2px solid;
          outline: none;
          box-shadow: none;
      }

      #inner-box {
          margin: 20px;
          margin-top: 0px;
          border: none;
          color: #fff;
          border-radius: 16px;
      }

      #inner-box * {
          transition: none;
      }

      #outer-box {
          margin: 0px;
          border: none;
          padding: 0px;
          border-radius: 16px;
      }

      #scroll {
          margin-top: 0px;
          border: none;
          border-radius: 16px;
          margin-bottom: 4px;
      }

      #text:selected {
          color: #fff;
          font-weight: bold;
      }

      #img {
          margin-right: 20px;
          background: transparent;
      }

      #text {
          margin: 0px;
          border: none;
          padding: 0px;
          background: transparent;
      }

      #entry {
          margin: 0px;
          border: none;
          border-radius: 16px;
          background-color: transparent;
          min-height:32px;
          font-weight: bold;
          padding-left: 10px;
      }

      #entry:selected {
          outline: none;
          margin: 0px;
          padding-left: 8px;
          border: 2px solid #6791C9;
          border-radius: 16px;
          background: rgba(29, 29, 29, 0.6);
      }
    '';
  };
}

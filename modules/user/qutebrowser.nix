{pkgs, ...}: {
  programs.qutebrowser = {
    enable = true;

    greasemonkey = [
      (pkgs.writeText "yt-ads.js" ''
        // ==UserScript==
        // @name         Auto Skip YouTube Ads
        // @version      1.1.0
        // @description  Speed up and skip YouTube ads automatically
        // @author       jso8910 and others
        // @match        *://*.youtube.com/*
        // ==/UserScript==

        document.addEventListener('load', () => {
          const btn = document.querySelector('.videoAdUiSkipButton,.ytp-ad-skip-button-modern')
          if (btn) {
              btn.click()
          }
          const ad = [...document.querySelectorAll('.ad-showing')][0];
          if (ad) {
              document.querySelector('video').currentTime = 9999999999;
          }
        }, true);
      '')
    ];

    keyBindings = {
      normal = {
        "cs" = "cmd-set-text -s :config-source";
        "tt" = "config-cycle tabs.position top left";
        "th" = "config-cycle tabs.show multiple never";
        "sh" = "config-cycle statusbar.show always never";
        "T" = "hint links tab";
        "pP" = "open -- {primary}";
        "pp" = "open -- {clipboard}";
        "pt" = "open -t -- {clipboard}";
        "qm" = "macro-record";
        "gj" = "tab-move +";
        "gk" = "tab-move -";
        "gm" = "tab-move";
      };
    };

    settings = {
      colors = {
        statusbar = {
          normal.bg = "#121212";
          command.bg = "#121212";
          command.fg = "#FFFFFF";
          normal.fg = "#DF5B61";
          passthrough.fg = "#DE8F78";
          url.fg = "#6791C9";
          url.success.https.fg = "#6791C9";
          url.hover.fg = "#BC83E3";
        };

        tabs = {
          even.bg = "#121212";
          odd.bg = "#121212";
          bar.bg = "#121212";
          even.fg = "#BBBBBB";
          odd.fg = "#BBBBBB";
          selected.even.bg = "#121212";
          selected.odd.bg = "#121212";
          selected.even.fg = "#FFFFFF";
          selected.odd.fg = "#FFFFFF";
          indicator.start = "#70B8CA";
          indicator.stop = "#78B892";
        };

        hints = {
          bg = "#121212";
          fg = "#FFFFFF";
        };

        completion = {
          item.selected.match.fg = "#6791C9";
          match.fg = "#6791C9";
          odd.bg = "#121212";
          even.bg = "#121212";
          fg = "#FFFFFF";
          category.bg = "#121212";
          category.fg = "#FFFFFF";
          item.selected.bg = "#121212";
          item.selected.fg = "#FFFFFF";
        };

        messages = {
          info.bg = "#121212";
          info.fg = "#FFFFFF";
          error.bg = "#121212";
          error.fg = "#FFFFFF";
        };

        downloads = {
          error.bg = "#121212";
          error.fg = "#FFFFFF";
          bar.bg = "#121212";
          start.bg = "#70B8CA";
          start.fg = "#FFFFFF";
          stop.bg = "#78B892";
          stop.fg = "#FFFFFF";
        };

        tooltip.bg = "#121212";
        webpage.bg = "#121212";

        webpage.darkmode = {
          enabled = true;
          algorithm = "lightness-cielab";
          policy.images = "never";
        };
      };

      tabs = {
        show = "multiple";
        title.format = "{audio}{index}: {current_title}";
        indicator.width = 0;
        width = "15%";
      };

      fonts = {
        web.size.default = 16;
        default_family = [];
        default_size = "13pt";
        web.family.fixed = "monospace";
        web.family.sans_serif = "monospace";
        web.family.serif = "monospace";
        web.family.standard = "monospace";
      };

      window.transparent = true;
      hints.border = "#FFFFFF";
      auto_save.session = true;
      content.blocking.enabled = true;
    };

    extraConfig = ''
      c.url.searchengines = {
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        '!gh': 'https://github.com/search?o=desc&q={}&s=stars',
        '!yt': 'https://www.youtube.com/results?search_query={}',
      }

      config.set('colors.webpage.darkmode.enabled', False, 'file://*')
      config.set("content.webgl", False, "*")
      config.set("content.canvas_reading", False)
      config.set("content.geolocation", False)
      config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
      config.set("content.cookies.accept", "all")
      config.set("content.cookies.store", True)

      c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem']
      c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 9, 'right': 9}
      config.load_autoconfig()
    '';
  };
}

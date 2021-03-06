function smoothservice() as object
    
    constants={
        AUTH_URL: "https://auth.smoothstreams.tv/hash_api.php",
        MMA_AUTH_URL: "https://www.mma-tv.net/loginForm.php",
        'FEED_URL: "http://guide.smoothstreams.tv/feed.json"
        FEED_URL: "http://sstv.getenjoyment.net/ss_roku3hr.json"
    }
    
    loginResult=""
    
    return {
      constants: constants,
      sites: smoothservice_sites(),
      servers: smoothservice_servers(),
      login: smoothService_authenticate,
      loginResult: loginResult,
      schedule: smoothService_getSchedule,
      logos: smoothService_channelLogos(),
    }
    
end function
    
    
    
function smoothService_authenticate(username as string, password as string, site as string) as object
    
    
    response = {}
    
    ' try to login
    loginUrlTransfer = CreateObject("roUrlTransfer")
    loginUrlTransfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    'print loginUrlTransfer.escape(site) + " " + site
    if site = "viewmmasr" then
      loginUrl = m.constants.MMA_AUTH_URL + "?username=" + loginUrlTransfer.escape(username)
    else
      loginUrl = m.constants.AUTH_URL + "?username=" + loginUrlTransfer.escape(username)
    end if
    loginUrl = loginUrl + "&password=" + loginUrlTransfer.escape(password)
    loginUrl = loginUrl + "&site=" + loginUrlTransfer.escape(site)
    loginUrlTransfer.SetURL(loginUrl)
    response = ParseJson(loginUrlTransfer.GetToString())
    m.loginResult = response
    return m
    
end function
    
function smoothService_getSchedule() as object

    searchRequest = CreateObject("roUrlTransfer")
    'searchRequest.SetCertificatesFile("common:/certs/ca-bundle.crt")
    searchRequest.SetURL(m.constants.FEED_URL)
    response = ParseJson(searchRequest.GetToString())
    'print response
    return response
    
end function
    
function smoothService_sites() as object
    return {
        l247: {
          name: "Live 247",
          service: "view247",
          port: "3625"
        },
        ss: {
          name: "StarStreams",
          service: "viewss",
          port: "3665"
        },
        mma: {
          name: "MMA SR+",
          service: "viewmmasr",
          port: "3645"
        },
        stvn: {
          name: "StreamTVnow",
          service: "viewstvn",
          port: "3615"
        }
    }
end function

function smoothService_servers() as object
    return {
      EUAmsterdam: {
        name: "EU Amsterdam 1",
        url: "dEU-NL1.SmoothStreams.tv",
        port: "443"
      },
      EUAmsterdam2: {
        name: "EU Amsterdam 2",
        url: "dEU-NL2.SmoothStreams.tv",
        port: "443"
      },
      EUFrankfurt: {
        name: "EU Amsterdam 3",
        url: "dEU-NL3.SmoothStreams.tv",
        port: "443"
      },
      EUBreda: {
        name: "EU Amsterdam 4",
        url: "dEU-NL4.SmoothStreams.tv",
        port: "443"
      },
      EUEnschede: {
        name: "EU Amsterdam 5",
        url: "dEU-NL5.SmoothStreams.tv",
        port: "443"
      },
      EULondon: {
        name: "EU London 1",
        url: "dEU-UK1.SmoothStreams.tv",
        port: "443"
      },
      EULondon2: {
        name: "EU London 2",
        url: "dEU-UK2.SmoothStreams.tv",
        port: "443"
      },
      USEastNJ: {
        name: "US East NJ",
        url: "dNAE1.SmoothStreams.tv",
        port: "443"
      },
      USEastVA: {
        name: "US East VA",
        url: "dNAE2.SmoothStreams.tv",
        port: "443"
      },
      CANEastOne: {
        name: "CAN East MTL",
        url: "dNAE3.SmoothStreams.tv",
        port: "443"
      },
      CANEastTwo: {
        name: "CAN East TOR",
        url: "dNAE4.SmoothStreams.tv",
        port: "443"
      },
      USEastNY: {
        name: "US East NY",
        url: "dNAe6.smoothstreams.tv",
        port: "443"
      },
      USWestone: {
        name: "US West PHX",
        url: "dNAw1.smoothstreams.tv",
        port: "443"
      },
      USWesttwo: {
        name: "US West LA",
        url: "dNAw2.smoothstreams.tv",
        port: "443"
      },
      USWestthree: {
        name: "US West SJ",
        url: "dNAw3.smoothstreams.tv",
        port: "443"
      },
      USWestfour: {
        name: "US West CHI",
        url: "dNAw4.smoothstreams.tv",
        port: "443"
      }
      Asia: {
        name: "Asia",
        url: "dSG.SmoothStreams.tv",
        port: "443"
      },
      Asiatwo: {
        name: "Asia 2",
        url: "dap.SmoothStreams.tv",
        port: "443"
      }
    }
end function
    
function smoothService_channelLogos() as object
   return {
    c1:"nn/nbc_us_central.png",
    c2:"cc/cbs.png",
    c3:"cc/cartoon_network_global.png",
    c4:"cc/comedy_central_us.png",
    c5:"ss/showtime.png",
    c6:"hh/hbo.png",
    c7:"aa/amc.png",
    c8:"gg/golf_channel_us.png",
    c9:"dd/discovery_us.png",
    c10:"nn/nat_geo_us.png",
    c11:"hh/history_europe.png",
    c12:"nn/nbc_sports_network.png",
    c13:"bb/be_in_sports_global.png",
    c14:"ee/espnews.png",
    c15:"ee/espn.png",
    c16:"ee/espn_2.png",
    c17:"ee/espn_u.png",
    c18:"ff/fox_sports1_us.png",
    c19:"nn/nfl_network.png",
    c20:"nn/nba_tv.png",
    c21:"mm/mlb_network.png",
    c22:"nn/nhl_network.png",
    c23:"tt/tsn.png",
    c24:"ss/sportsnet_ontario.png",
    c25:"ss/sportsnet_world.png",
    c26:"ff/fight_network.png",
    c27:"",
    c28:"",
    c29:"ss/sky_uk_sports_hd.png",
    c30:"",
    c31:"",
    c32:"",
    c33:"",
    c34:"",
    c35:"",
    c36:"ss/sky_uk_sports_hd.png",
    c37:"ss/sky_uk_sports_hd.png",
    c38:"ss/sky_uk_sports_hd.png",
    c39:"ss/sky_uk_sports_hd.png",
    c40:"",
    c41:"ff/fox_sports2_us.png",
    c42:"",
    c43:"",
    c44:"",
    c45:"",
    c46:"",
    c47:"",
    c48:"",
    c49:"",
    c50:"",
    c51:"",
    ABC:"aa/abc_hd.png",
    BBCOneHD:"bb/bbc_one_hd.png",
    beINSportUS1:"bb/be_in_sports_us.png",
    Boxnation:"bb/box_nation.png",
    BTSport1:"bb/bt_sport_1.png",
    BTSport1HD:"bb/bt_sport_1_hd.png",
    BTSport2:"bb/bt_sport_2.png",
    BTSport2UK:"bb/bt_sport_2.png",
    CBS:"cc/cbs.png",
    CBSSN:"cc/cbs_sports_network.png",
    ESPN:"ee/espn.png",
    ESPNDeportes:"ee/espn_deportes.png",
    ESPNUK:"ee/espn_uk.png",
    ESPN2:"ee/espn_2.png",
    ESPNews:"ee/espnews.png",
    ESPNU:"ee/espn_u.png",
    Eurosport:"ee/eurosport.png",
    EurosportHD:"ee/eurosport_hd.png",
    FightNetwork:"ff/fight_network.png",
    FOX:"ff/fox_global.png",
    FOXSeattle:"ff/fox_global.png",
    FOXSports1EredivisieHD:"ff/fox_sports_eredivisie_01.png",
    FOXSports3EredivisieHD:"ff/fox_sports_eredivisie_03.png",
    FS1:"ff/fox_sports1_us.png",
    FS2:"ff/fox_sports2_us.png",
    FSP:"ff/fox_soccer_plus.png",
    FX:"ff/fx_us.png",
    GolfChannel:"gg/golf_channel_us.png",
    GolTV:"gg/gol_tv.png",
    HBO:"hh/hbo.png",
    KTLA:"kk/ktla_cw5_los_angeles.png",
    MLBN:"mm/mlb_network.png",
    Multideporte1:"cc/canalplus_es_multideporte.png",
    NBAtv:"nn/nba_tv.png",
    NBC:"nn/nbc_us_central.png",
    NBCSN:"nn/nbc_sports_network.png",
    NFLNet:"nn/nfl_network.png",
    NFLNetwork:"nn/nfl_network.png",
    NFLRedZone:"nn/nfl_red_zone.png",
    RTETwo:"rr/rte_two.png",
    SkySport11DE:"ss/sky_de_sport.png",
    SkySport7DE:"ss/sky_de_sport.png",
    SkySportAustria:"ss/sky_de_sport_austria.png",
    SkySportHD1DE:"ss/sky_de_sport_01_hd.png",
    SkySportHD10DE:"ss/sky_de_sport.png",
    SkySportHD2DE:"ss/sky_de_sport_02_hd.png",
    SkySportHD3DE:"ss/sky_de_sport.png",
    SkySportHD4DE:"ss/sky_de_sport.png",
    SkySportHD5DE:"ss/sky_de_sport.png",
    SkySportHD6DE:"ss/sky_de_sport.png",
    SkySportHD7DE:"ss/sky_de_sport.png",
    SkySportHD8DE:"ss/sky_de_sport.png",
    SkySportHD9DE:"ss/sky_de_sport.png",
    SkySports1HDUK:"ss/sky_uk_sports1_hd.png",
    SkySports1UK:"ss/sky_uk_sports1.png",
    SkySports2:"ss/sky_uk_sports2.png",
    SkySports2UK:"ss/sky_uk_sports2.png",
    SkySports5UK:"ss/sky_uk_sports5.png",
    SkySportsNewsUK:"ss/sky_uk_sports_news_hq.png",
    SNETOntario:"ss/sportsnet_ontario.png",
    SNET360:"ss/sportsnet_360.png",
    SNETO:"ss/sportsnet_360.png",
    SNETWL:"ss/sportsnet_world_hd.png",
    Sport1US:"ss/sport1_de_us.png",
    Sport1VoetbolNL:"ss/sport1_nl_voetbal.png",
    SyFy:"ss/syfy_us.png",
    TNT:"tt/tnt_us.png",
    TSN:"tt/tsn_ca.png",
    TSN2:"tt/tsn2.png"
    }
end function

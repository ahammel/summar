-module(summar_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile(
                 [{'_', [{"/",
                          cowboy_static,
                          {priv_file, summar, "static/index.json",
                           [{mimetypes, cow_mimetypes, all}]}},
                         {"/static/[...]",
                          cowboy_static,
                          {priv_dir, summar, "static"}}
                        ]}]
                )
    , {ok, _} = cowboy:start_http(
                  my_http_listener, 100, [{port, 8080}],
                  [{env, [{dispatch, Dispatch}]}]
                )
    , summar_sup:start_link().

stop(_State) ->
	ok.

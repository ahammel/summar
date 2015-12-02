{application, summar, [
	{description, ""},
	{vsn, "rolling"},
	{modules, ['summar_app','summar_sup']},
	{registered, [summar_sup]},
	{applications, [kernel,stdlib,cowboy]},
	{mod, {summar_app, []}}
]}.

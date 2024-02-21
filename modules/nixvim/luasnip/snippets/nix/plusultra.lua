return {
	s("pul", {
		fmt(
			[[
{{
  pkgs,
  lib,
  ...
}}:
with lib;
with lib.plusultra; {{
	{}
}}
]],
			i(1, "body")
		),
		t("with lib.plusultra; {\t"),
		i(1, "body"),
		t(""),
		t("}"),
	}),
}

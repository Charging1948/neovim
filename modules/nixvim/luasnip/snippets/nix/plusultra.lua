return {
	s("pul", {
		t("{pkgs, lib, config, ...}:"),
		t("with lib.plusultra; {\t"),
		i(1, "body"),
		t(""),
		t("}"),
	}),
}

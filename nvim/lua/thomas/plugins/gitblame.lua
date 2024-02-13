-- import gitblame safely
local gitblame_status, gitblame = pcall(require, "gitblame")
if not gitblame then
	return
end

gitblame.setup({
	highlight_group = "Whitespace",
	message_template = "  <author> • <date> • <summary> • <sha>",
	date_format = "%r (%x)",
	message_when_not_committed = "",
	use_blame_commit_file_urls = true,
})

local notify_setup, notify = pcall(require, "notify")

if not notify_setup then
	return
end

notify.setup({
	render = "wrapped-compact",
	stages = "fade",
	icons = {
		INFO = "󰙎",
		WARN = "⚠",
		ERROR = " ",
		TRACE = "󰏫 ",
		DEBUG = " ",
	},
})

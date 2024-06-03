require('remote-sshfs').setup({
  sshfs_args = { -- arguments to pass to the sshfs command
      "-o reconnect",
      "-o ConnectTimeout=5",
      "-o compression=no",
      "-o nonempty",
      "-o auto_cache",
      "-o workaround=all",
    },
})
--load telescope extension
require('telescope').load_extension 'remote-sshfs'

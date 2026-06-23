### 修正パッチ配布

_※ 現在、パッチを適用しなくても動作し不要になりました。_

```markdown
cd .file/patch

# パッチを生成 (作り直し時)
diff -u /mnt/c/Users/user/AppData/Local/nvim-data/mason/packages/solargraph/gems/rbs-4.0.3/lib/rbs/environment_loader.rb environment_loader.rb > environment_loader.patch

# パッチを適用 (Windows)
patch -u /mnt/c/Users/user/AppData/Local/nvim-data/mason/packages/solargraph/gems/rbs-4.0.3/lib/rbs/environment_loader.rb < environment_loader.patch

# パッチを適用 (UNIX)
patch -u ~/.local/share/nvim/mason/packages/solargraph/gems/rbs-4.0.3/lib/rbs/environment_loader.rb < environment_loader.patch
```

- Windows環境、WSL2でパッチ適用を検証しました。(C:/Users/ユーザ名/)。✅️
- UNIX環境、Hyper-V上のUbuntu-24.04でパッチ適用を検証しました。✅️

> /mnt/c/Users/user/AppData/Local/nvim-data/mason/packages/solargraph/gems/solargraph-0.60.1/lib/solargraph/library.rb
>
>:487:in 'Solargraph::Library#next_map': can't add a new key into hash during iteration (RuntimeError)

※ rubygems/solargraph、LSPを起動すると度々lsp.logにRuntimeErrorが残っています。

更新履歴: 2026/06/23🔄

### 修正パッチ配布

_※ 現在は、パッチがなくても動作します。不要です。_

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
> next_map: can't add a new key into hash during iteration (RuntimeError)

※ rubygem/solargraph、上記メッセージがたまにありますが動作はします。

更新履歴: 2026/06/23🔄

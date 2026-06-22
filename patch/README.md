> C:/Users/user/AppData/Local/nvim-data/mason/packages/solargraph/gems/rbs-4.0.3/lib/rbs/environment_loader.rb:26:in '<class:EnvironmentLoader>': 
>
> undefined method 'Pathname' for class RBS::EnvironmentLoader (NoMethodError)

```markdown
# パッチを生成 (作り直し時)
diff -u /mnt/c/Users/user/AppData/Local/nvim-data/mason/packages/solargraph/gems/rbs-4.0.3/lib/rbs/environment_loader.rb environment_loader.rb > environment_loader.patch

# パッチを適用 (Windows)
patch -u /mnt/c/Users/user/AppData/Local/nvim-data/mason/packages/solargraph/gems/rbs-4.0.3/lib/rbs/environment_loader.rb < environment_loader.patch

# パッチを適用 (UNIX)
patch -u ~/.local/share/nvim/mason/packages/solargraph/gems/rbs-4.0.3/lib/rbs/environment_loader.rb < environment_loader.patch
```

_※ 各環境で修正パッチ適用を推奨します。_

- Windows環境、WSL2でパッチ適用を検証しました。(C:/Users/ユーザ名/)。✅️
- UNIX環境、Hyper-V上のUbuntu-24.04でパッチ適用を検証しました。✅️

更新履歴: 2026/06/22🔄

cask 'android-ndk-for-unity@2021.2.8f1' do
    version '21d'
    sha256 '5851115c6fc4cce26bc320295b52da240665d7ff89bda2f5d5af1887582f5c48'
  
    # dl.google.com/android/repository/android-ndk was verified as official when first introduced to the cask
    url "https://dl.google.com/android/repository/android-ndk-r#{version}-darwin-x86_64.zip"
    name 'Android NDK'
    homepage 'https://developer.android.com/ndk/index.html'
  
    conflicts_with cask: 'crystax-ndk'
  
    # shim script (https://github.com/Homebrew/homebrew-cask/issues/18809)
    shimscript = "#{staged_path}/ndk_exec.sh"
    preflight do
      FileUtils.ln_sf("#{staged_path}/android-ndk-r#{version}", "#{HOMEBREW_PREFIX}/share/android-ndk")
  
      IO.write shimscript, <<~EOS
        #!/bin/bash
        readonly executable="#{staged_path}/android-ndk-r#{version}/$(basename ${0})"
        test -f "${executable}" && exec "${executable}" "${@}"
      EOS
    end
  
    [
      'ndk-build',
      'ndk-depends',
      'ndk-gdb',
      'ndk-stack',
      'ndk-which',
    ].each { |link_name| binary shimscript, target: link_name }
  
    uninstall_postflight do
      FileUtils.rm("#{HOMEBREW_PREFIX}/share/android-ndk")
    end
  
    caveats <<~EOS
      You may want to add to your profile:
         'export ANDROID_NDK_HOME="#{HOMEBREW_PREFIX}/share/android-ndk"'
    EOS
  end
  
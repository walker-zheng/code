#! /usr/bin/python3
import os
import platform as pf
import subprocess


def unzip_package(ver):
    pkg_path = 'protobuf-cpp-' + ver + '.zip'
    pkg_folder = 'protobuf-' + ver
    # print(ver, pkg_path, pkg_folder)
    if os.path.exists(pkg_folder):
        return True
    if not os.path.exists(pkg_path):
        print('check pkg_path:', pkg_path)
        return False
    subprocess.call(['unzip', pkg_path])
    if not os.path.exists(pkg_folder):
        print('check pkg_folder:', pkg_folder)
        return False
    return True


def upload_package(ver, platforms, upload_prefix):
    for platform in platforms:
        output_path = ver + '/output_' + platform
        output_pb_path = output_path + '/protobuf'
        print(output_path, output_pb_path)
        if not os.path.exists(output_path) or not os.path.exists(output_pb_path):
            continue
        if os.path.exists('output'):
            os.remove('output')
        config = dict()
        ver_compact = ''.join(ver.split('.'))
        config['install_artifact'] = upload_prefix + \
            'pb' + ver_compact + ':protobuf:' + ver + ':zip'
        config['repository2_username'] = 'meiyang.zheng'
        config['repository2_password'] = 'Aa123456'
        config['username'] = 'meiyang.zheng'
        config['password'] = 'Aa123456'
        config['platform'] = 'linux'
        config['architecture'] = 'default'
        config['vendor'] = 'default'
        config['toolchain'] = 'default'
        if platform == 'ubuntu16':
            config['vendor'] = 'ubuntu'
            config['toolchain'] = 'gcc5.4.0'
        elif platform == 'android':
            config['platform'] = 'android'
        elif platform == 'aarch64':
            config['architecture'] = 'aarch64-j2'
            config['vendor'] = 'hobot'
            config['toolchain'] = 'gcc6.5.0'
        elif platform == 'mac':
            config['platform'] = 'mac'
        elif platform == 'win':
            config['platform'] = 'win'
            config['architecture'] = 'x64'
        config_str = '\n'.join([k + '=' + v for k, v in config.items()])
        with open('build.properties.local', 'w+') as f:
            f.write(config_str)
            f.close()
        if os.path.exists('output'):
            os.remove('output')
        print(config_str)
        if platform != 'win':
            os.symlink(output_path, 'output')
            subprocess.call(['./gradlew upload'], shell=True)
        else:
            os.system('.\gradlew.bat --stacktrace upload')



def build_package(ver, platforms, cc_paths, build_type='Release'):
    protoc_path = os.path.join('..', '..', 'tools', 'protoc')
    if ver != '2.6.1':
        protoc_path = os.path.join('..', '..', 'tools', 'protoc-' + ver)
    sysname = pf.uname().system
    if sysname == 'Linux':
        protoc = os.path.join(protoc_path, 'protoc')
        # cc
        cc_android = cc_paths['android'] + '/aarch64-linux-android26-clang'
        cxx_android = cc_paths['android'] + '/aarch64-linux-android26-clang++'
        if not os.path.exists(cc_android) or not os.path.exists(cxx_android):
            print('check cc_path:', cc_android, cxx_android)
            return False
        cc_aarch64 = cc_paths['aarch64'] + '/aarch64-linux-gnu-gcc'
        cxx_aarch64 = cc_paths['aarch64'] + '/aarch64-linux-gnu-g++'
        if not os.path.exists(cc_aarch64) or not os.path.exists(cxx_aarch64):
            print('check cc_path:', cc_aarch64, cxx_aarch64)
            return False
    elif sysname == 'Darwin':
        protoc = os.path.join(protoc_path, 'protoc-mac')
    elif sysname == 'Windows':
        protoc = os.path.join(protoc_path, 'protoc.exe')
    else:
        print('check protoc for sysname:', sysname)
        return False
    # print(ver, protoc_path, protoc)
    for platform in platforms:
        build_cmd = '../configure --prefix=/ CFLAGS="-fPIC" CXXFLAGS="-fPIC" '
        make_cmd = 'VERBOSE=1 make -j18'
        cc = ''
        cxx = ''
        build_path = os.path.join('protobuf-' + ver, 'build_' + platform)
        dir_path = os.path.dirname(os.path.realpath(__file__))
        output_path = os.path.join(
            dir_path, ver, 'output_' + platform, 'protobuf')
        install_cmd = 'make install DESTDIR={}'.format(output_path)
        print(sysname, platform, ver)
        if sysname == 'Linux' and platform in ['linux', 'ubuntu16', 'aarch64', 'android']:
            if platform == "aarch64":
                cc = cc_paths['aarcj64'] + '/aarch64-linux-gnu-gcc'
                cxx = cc_paths['aarcj64'] + '/aarch64-linux-gnu-g++'
                build_cmd += '--host=aarch64-linux --enable-cross-compile'
            elif platform == "android":
                cc = cc_paths['android'] + '/aarch64-linux-android26-clang'
                cxx = cc_paths['android'] + '/aarch64-linux-android26-clang++'
                build_cmd += 'LIBS="-llog -lz -lc++_static" --host=aarch64-linux-android --enable-cross-compile'
            else:
                pass
            build_cmd += ' CC={} CXX={} --with-protoc={}'.format(
                cc, cxx, protoc)
        elif sysname == 'Darwin' and platform == 'mac':
            build_cmd += ' --with-protoc={}'.format(protoc)
            pass
        elif sysname == 'Windows' and platform == 'win':
            cmake_dir = os.path.join('..', 'cmake')
            build_cmd = 'cmake -G "Visual Studio 16 2019" {} '.format(cmake_dir)
            make_cmd = 'cmake --build . --config {}'.format(build_type)
            install_cmd = 'cmake --build . --config {} -t Install'.format(build_type)
        else:
            continue
        build_cmd = "cd {} && {} && {} && {}".format(
            build_path, build_cmd, make_cmd, install_cmd)
        if not os.path.exists(build_path):
            os.mkdir(build_path)
        # print(cc, cxx, build_path, output_path)
        print(build_cmd)
        subprocess.check_output(build_cmd, shell=True)


def check_path(ver, cc_paths):
    # protoc
    protoc_path = 'tools/protoc'
    protoc = ''
    if ver != '2.6.1':
        protoc_path = 'tools/protoc-' + ver
    sysname = pf.uname().system
    if sysname == 'Linux':
        protoc = protoc_path + '/protoc'
    elif sysname == 'Darwin':
        protoc = protoc_path + '/protoc-mac'
    elif sysname == 'Windows':
        protoc = protoc_path + '/protoc.exe'
    if not os.path.exists(protoc):
        print('check protoc:', protoc)
        return False
    # package
    pkg_folder = 'protobuf-' + ver
    if not os.path.exists(pkg_folder):
        print('check pkg_folder:', pkg_folder)
        return False


if __name__ == '__main__':
    # pb_vers = ['3.5.1', '3.6.1']
    pb_vers = ['3.6.1']
    upload_prefix = 'com.hobot.native.hobot.auto.test.test1.'
    platforms = ['linux', 'ubuntu16', 'aarch64', 'android', 'mac', 'win']
    # platforms = ['android','mac','win']
    cc_paths = dict()
    # cc_paths['aarch64']='/opt/gcc-linaro-6.5.0-2018.12-x86_64_aarch64-linux-gnu/bin/'
    cc_paths['aarch64'] = '/home/meiyang.zheng/workspace/opt/gcc-linaro-6.5.0-2018.12-x86_64_aarch64-linux-gnu/bin'
    # cc_paths['android']='/home/softwares/android-ndk-r21b/toolchains/llvm/prebuilt/linux-x86_64/bin'
    cc_paths['android'] = '/home/meiyang.zheng/workspace/opt/android-ndk-r21b/toolchains/llvm/prebuilt/linux-x86_64/bin'

    for ver in pb_vers:
        unzip_package(ver)
        check_path(ver, cc_paths)
        build_package(ver, platforms, cc_paths)
        upload_package(ver, platforms, upload_prefix)

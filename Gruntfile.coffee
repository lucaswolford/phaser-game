module.exports = (grunt) ->
  grunt.initConfig
    watch:
      coffee:
        files: ['src/*.coffee', 'specs/*.coffee'],
        tasks: ['coffee:sourceCompile', 'coffee:testCompile', 'test']

    coffee:
      sourceCompile:
        expand: true,
        flatten: true,
        cwd: "#{__dirname}/src/",
        src: ['*.coffee'],
        dest: 'dist/js/',
        ext: '.js'
      testCompile:
        expand: true,
        flatten: true,
        cwd: "#{__dirname}/specs/",
        src: ['*.coffee'],
        dest: 'specs/js/',
        ext: '.js'

    jasmine:
      test:
        src: ['dist/lib/js/*.js', 'dist/js/*.js'],
        options:
          specs: 'specs/js/*Spec.js',

    'gh-pages':
      options:
        base: 'dist'
      src: '**'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'
  grunt.loadNpmTasks 'grunt-gh-pages'

  grunt.registerTask 'test', ['jasmine']
  grunt.registerTask 'default', ['watch']
  grunt.registerTask 'deploy', ['jasmine', 'gh-pages']

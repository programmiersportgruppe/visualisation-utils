require "visualisation-utils/version"

module VisualisationUtils

    class BasicParser
        def standard_opts(opt)
            opt.opt :outfile, "Output file name", :type => String, :short => 'o'
            opt.opt :debug, "debug"
            opt.opt :title, "Title", :type => String, :short => 't'
            opt.opt :font, "Font", :type => String, :short => 'f'
            opt.opt :extra_header, "Extra commands to be put in the header of the gnuplot file", :type => String
        end
    end

    # Wraps the gnu plot invocation and basic scaffold for shared options
    # around output format.
    class GnuPlotTool

        def initialize(opts)
            @title = opts[:title] || ""
            @opts = opts
            @debug = opts[:debug]

            if (! system 'which -s gnuplot')
                STDERR.puts("This utility depends on gnuplot. Please install gnuplot using your favourite package manager.")
                exit(1)
            end

            font = @opts[:font] || "Futura"
            font_size = "12"

            @extra_header = @opts[:extra_header] || ""

            if (@opts[:outfile])
                filename = @opts[:outfile]
                extension = filename.gsub(/[^.]*\./, "")
                if (extension == "png")
                    @terminal=<<EOF
            set term pngcairo font '#{font},#{font_size}' transparent size 1200,800
            set output '#{filename}'
EOF
                elsif (extension == "eps")
                    @terminal=<<EOF
            set term epscairo size 1200,800 font '#{font},#{font_size}'
            set output '#{filename}'
EOF
                elsif (extension == "pdf")
                    @terminal=<<EOF
            set term pdfcairo size 22cm,14cm font '#{font},#{font_size}'
            set output '#{filename}'
EOF
                elsif (extension == "svg")
                    @terminal=<<EOF
            set term svg size 1200,800 font '#{font},#{font_size}'
            set output '#{filename}'
EOF
                else
                    throw "Unknown output format '.#{extension}'."
                end
            end
        end

        def debug?
            @debug
        end

        def plot(script)
            plot_file_name="/tmp/plot-"+`date  "+%s"`.strip+".plt"
            full_script=<<EOF
#{@terminal}
                set title "#{@title}"

                #{@extra_header}

                #{script}
EOF

            if (debug?)
                STDERR.puts "plot file " + plot_file_name
            end

            File.open(plot_file_name, "w") { |f| f.write(full_script) }

            persistent_opt = @opts[:outfile] ? "" : "-p"

            `gnuplot #{persistent_opt} #{plot_file_name}`

        end
    end

end

# TODO
# http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html#usage
# palette="palette.png"
# filters="scale=300:-1:flags=lanczos"

ffmpeg -ss 44 -t 4 -i foo.mp4 -vf "$filters,palettegen" -y $palette
ffmpeg -ss 44 -t 4 -i foo.mp4 -i palette.png -lavfi "scale=300:-1:flags=lanczos [x]; [x][1:v] paletteuse" foo-opt.gif




ffmpeg -ss 44 -t 4 -i foo.mp4 -vf scale=300:-1 -y foo.gif
ffmpeg -ss 44 -t 4 -i foo.mp4 -i palette.png -lavfi "scale=300:-1:flags=lanczos [x]; [x][1:v] paletteuse" foo-opt.gif
ffmpeg -ss 44 -t 4 -i foo.mp4 -i palette.png -lavfi "scale=300:-1:flags=lanczos [x]; [x][1:v] paletteuse=dither=bayer:bayer_scale=3" foo-opt-dither-bayer-3.gif
ffmpeg -ss 44 -t 4 -i foo.mp4 -i palette.png -lavfi "scale=300:-1:flags=lanczos [x]; [x][1:v] paletteuse=dither=floyd_steinberg" foo-opt-dither-floyd.gif


# ffmpeg -ss 44 -t 4 -i foo.mp4 -vf "scale=300:-1:flags=lanczos,palettegen" -f image2pipe pipe: | ffmpeg -ss 44 -t 4 -i foo.mp4 -i pipe: -lavfi "scale=300:-1:flags=lanczos [x]; [x][1:v] paletteuse=dither=floyd_steinberg" out.gif



ffmpeg -ss 44 -t 4 -i in.mp4 -vf "scale=300:-1:flags=lanczos,palettegen" -f image2pipe pipe: | ffmpeg -ss 44 -t 4 -i in.mp4 -i pipe: -lavfi "scale=300:-1:flags=lanczos [x]; [x][1:v] paletteuse=dither=bayer" out.gif
# start time -ss / trim filter
# duration -t / trim filter
# fps -r / fps filter
# size scale filter

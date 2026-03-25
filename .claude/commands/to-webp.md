Convert an image or video file to WebP format with optional resizing.

## Usage

`/to-webp <file_path> [width]x[height] [quality]`

Examples:
- `/to-webp ~/Downloads/photo.jpg` — convert at original size, default 80% quality
- `/to-webp ~/Downloads/photo.png 600x600 80` — resize to 600x600 at 80% quality
- `/to-webp ~/Downloads/video.mp4 800x800 70` — animated WebP from video at 70% quality
- `/to-webp ~/Downloads/photo.jpg 1200x0` — resize width to 1200, auto height

## Instructions

The user has invoked the `/to-webp` skill. Parse `$ARGUMENTS` for:
1. **file_path** — required, the source file (expand `~` if present)
2. **dimensions** — optional `WxH` (e.g. `600x600`). A `0` for either dimension means scale proportionally.
3. **quality** — optional integer 1–100, default `80`

Then execute the conversion using the Bash tool:

### For image files (jpg, jpeg, png, gif, tiff, bmp, avif, heic):
Use `cwebp`:
```bash
cwebp -q <quality> "<input>" -o "<output>.webp"
```
If dimensions are provided, resize first with `magick`:
```bash
magick "<input>" -resize <W>x<H> /tmp/to-webp-resized.<ext>
cwebp -q <quality> /tmp/to-webp-resized.<ext> -o "<output>.webp"
rm /tmp/to-webp-resized.<ext>
```

### For video files (mp4, mov, avi, mkv, webm):
Extract frames with ffmpeg, then assemble animated WebP with img2webp:
```bash
mkdir -p /tmp/to-webp-frames
ffmpeg -i "<input>" -vf "scale=<W>:<H>" /tmp/to-webp-frames/frame_%04d.png -y
# Get fps from: ffprobe -v quiet -select_streams v:0 -show_entries stream=r_frame_rate -of default=noprint_wrappers=1:nokey=1 "<input>"
# frame_duration_ms = round(1000 / fps)
img2webp -loop 0 -d <frame_duration_ms> -q <quality> /tmp/to-webp-frames/frame_*.png -o "<output>.webp"
rm -rf /tmp/to-webp-frames
```
If no dimensions specified for video, omit the `-vf scale` filter.

### Output naming:
Place the output file in the same directory as the input, replacing the extension with `.webp`.
If a quality suffix is needed for multiple outputs, append `_<quality>` before `.webp`.

### After conversion:
Report the output file path and size.

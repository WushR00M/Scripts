import json

def parse_osu_mania_chart(filename, key_count=4):
    chart = []
    in_hitobjects = False

    with open(filename, "r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()

            # Start parsing when we reach [HitObjects]
            if line == "[HitObjects]":
                in_hitobjects = True
                continue

            if in_hitobjects:
                if not line or line.startswith("//"):
                    continue

                parts = line.split(",")

                if len(parts) < 5:
                    continue

                x = int(parts[0])
                start_time = int(parts[2])
                type_flag = int(parts[3])
                lane = int(x / (512 / key_count))  # Convert x to lane index (0-3)

                # Bitmask check for hold note (type bit 128)
                is_hold = type_flag & 128

                if is_hold:
                    if len(parts) >= 6:
                        end_time = int(parts[5].split(":")[0])
                        duration = end_time - start_time
                        chart.append({"time": start_time, "lane": lane, "duration": duration})
                else:
                    chart.append({"time": start_time, "lane": lane})

    return chart

# Example usage
if __name__ == "__main__":
    input_file = "Chart.osu"
    output_file = "chart.json"

    notes = parse_osu_mania_chart(input_file, key_count=4)
    with open(output_file, "w", encoding="utf-8") as f:
        json.dump(notes, f, indent=2)

    print(f"Exported {len(notes)} notes to {output_file}")

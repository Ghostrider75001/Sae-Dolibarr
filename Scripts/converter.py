
import csv
from datetime import datetime

def convert_to_csv(input_file_path, output_file_path):
    try:
        with open(input_file_path, 'r') as infile, open(output_file_path, 'w', newline='') as outfile:
            writer = csv.writer(outfile)
            writer.writerow(['rowid', 'nom', 'entity', 'datec', 'tms', 'note', 'model_pdf'])  # Write header
            
            rowid = 1
            current_date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            for line in infile:
                writer.writerow([rowid, line.strip(), 1, 'NULL', current_date, 'NULL', 'NULL'])
                rowid += 1
    except FileNotFoundError:
        print(f"The file {input_file_path} does not exist.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    input_file_path = "Scripts/groupe.txt"
    output_file_path = "Scripts/groupe.csv"
    convert_to_csv(input_file_path, output_file_path)

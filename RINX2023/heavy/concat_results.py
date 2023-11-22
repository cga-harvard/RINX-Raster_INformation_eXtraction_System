
#####################################################################
#                                                                   #
# This is a collection of functions for merging and concatenating   #
# results from address and RINX                                     #
#                                                                   #
# Author: Mukul Rawat                                               #
# Reviewed by: Devika Kakkar                                        #
#                                                                   #
# *This was compiled on 10/07/2023 in Python 3.11.4*                #
#                                                                   #
#####################################################################




import os
import pandas as pd

def combine_csv_files(path, save_result_to_csv=False, output_path='combined_result.csv'):
    """
    Combine multiple CSV files in a directory and merge them into a single DataFrame.

    Args:
        path (str): Path to the directory containing CSV files.
        save_result_to_csv (bool, optional): Whether to save the result to a CSV file (default is False).
        output_path (str, optional): Path to save the combined result (default is 'combined_result.csv').

    Returns:
        pd.DataFrame: Combined DataFrame.

    Example:
    combine_csv_files('data_directory', save_result_to_csv=True)
    """
    try:
        combined_data = pd.DataFrame()
        
        for file in os.listdir(path):
            if file.endswith('.csv'):
                data_path = os.path.join(path, file)
                
                data = pd.read_csv(data_path, delimiter='\t', header=None)
    

                # Extract the variable_name from the file name
                if file == 'results_rh_ah.csv':
                    variable_name1= os.path.splitext(file)[0].split("_")[1]
                    variable_name2 = os.path.splitext(file)[0].split("_")[2]
                    data.columns = ['grid_id', 'day', variable_name1,variable_name2]
                
                else:

                    variable_name = os.path.splitext(file)[0].split("_")[1]

                    # Rename columns
                    data.columns = ['grid_id', 'day', variable_name]

                # Merge data based on 'Start_date' and 'grid_id'
                if combined_data.empty:
                    combined_data = data
                else:
                    combined_data = pd.merge(combined_data, data, on=['day', 'grid_id'])

        # combined_data['Start_date'] = pd.to_datetime(combined_data['Start_date'], format='%Y%m%d')
        if save_result_to_csv:
            combined_data.to_csv(output_path, index=False)

        return combined_data
    except (FileNotFoundError, pd.errors.EmptyDataError, pd.errors.ParserError, Exception) as e:
        raise Exception(f"Error combining CSV files: {e}")




def merge_with_climate_data(combined_data, climate_data_path, save_result_to_csv=True, output_path='combined_climate_result1.csv'):
    """
    Merge climate data with combined data by grid_id and Start_date.

    Args:
        combined_data (pd.DataFrame): DataFrame containing combined data.
        climate_data_path (str): Path to the climate data CSV file.
        save_result_to_csv (bool, optional): Whether to save the result to a CSV file (default is True).
        output_path (str, optional): Path to save the merged result (default is 'combined_climate_result.csv').

    Returns:
        pd.DataFrame: Merged DataFrame with climate data.

    Example:
    merge_with_climate_data(combined_data, 'climate_data.csv', save_result_to_csv=True)
    """
    try:
        climate_data = pd.read_csv(climate_data_path)
        climate_data['Start_date'] = pd.to_datetime(climate_data['Start_date'], format='%Y%m%d')
        climate_data['End_date'] = pd.to_datetime(climate_data['End_date'], format='%Y%m%d')

    except (FileNotFoundError, pd.errors.EmptyDataError, pd.errors.ParserError) as e:
        raise Exception(f"Error reading climate data: {e}")

    try:
        combined_data.rename(columns={'day': 'Start_date'}, inplace=True)
        combined_data['Start_date'] = pd.to_datetime(combined_data['Start_date'], format='%Y%m%d')
        result = combined_data.merge(climate_data, on="grid_id", how="left")
    except KeyError:
        raise Exception("Columns 'grid_id' and 'Start_date' not found in combined_data")

    if save_result_to_csv:
        try:
            result.to_csv(output_path, index=False)
        except Exception as e:
            raise Exception(f"Error saving merged data to CSV: {e}")

    return result


if __name__ == "__main__":
    path = './results'
    climate_data_path = './climate_input_02.csv'
    combined_data  = combine_csv_files(path, save_result_to_csv=True, output_path='./merg.csv')
    climate_data_merge = merge_with_climate_data(combined_data, climate_data_path)

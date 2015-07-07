DBO Module - basic overview (cba)
==========

 * ~~Connection made to Database in process via Postgrex.~~
 * ~~Query is assigned to a variable~~
 * ~~Query is formed in Raw SQL and pushed through Postgrex~~
 * ~~Postgrex returns `%Postgrex.Result{}` Struct~~
 * ~~We restructure the Struct into a Map of Tuples~~
 * ~~Take only what we need from Map - i.e. `rows`~~
 * ~~Enum.each iterate over each row (tuple)~~
 * ~~JSON serialise each~~
 
 
 
### Postgrex Result:

Postgrex returns results as Tuples.  How do we handle results?

		* Need column headers and result fields associated
		* Convert tuples to JSON with column headers as field key
		* Handle `%.Postgrex.Timestamp` 
		
		
1. Take `[:columns]` (table headers)
2. Take `[:rows]` (data)
3. Match up results in both, 1 by 1
4. Use `columns` data as JSON keys,  `rows` as values

-----------------------------------------------------------------

## rows_to_JSON output!

 * Change function to not output Map from Struct.
 * Re-jig formatting method to receive JSON
 * Parse JSON directly from output
 * Benchmark on both outputs??
 
 
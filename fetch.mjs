const url = process.argv[2];
try {
    const response = await fetch(url);
    console.log(`[NODE] Fetched ${url} - Status: ${response.status}`);
} catch (error) {
    console.error(`[NODE] Error fetching ${url}:`, error);
}
